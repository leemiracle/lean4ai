# REPL - 交互式执行环境

> **版本**: Master  
> **许可证**: Apache-2.0  
> **GitHub**: https://github.com/leanprover-community/repl

---

## 简介

**REPL** (Read-Eval-Print Loop) 为 Lean4 提供机器到机器的交互式执行环境,常用于 AI/ML 应用和外部工具集成。

## 快速开始

### 安装

在 `lakefile.toml` 中添加:

```toml
[[require]]
name = "repl"
scope = "leanprover-community"
rev = "master"
```

### 启动 REPL

```bash
# 启动交互式环境
lake repl

# 或直接运行
lake exe repl
```

## 核心功能

### 1. 环境交互

```bash
# 启动 REPL
$ lake repl

# 输入 Lean 代码
{"cmd": "def x := 42"}
# 输出
{"message": "x : Nat := 42"}

# 执行证明
{"cmd": "example : 1 + 1 = 2 := by rfl"}
# 输出
{"message": "proof complete"}

# 查看环境
{"cmd": "#check x"}
# 输出
{"message": "x : Nat"}
```

### 2. 证明状态管理

```bash
# 开始证明
{"cmd": "theorem test (n : Nat) : n < n + 1 := by"}

# 应用策略
{"tactic": "omega"}

# 输出
{"goals": [], "message": "proof complete"}
```

### 3. 环境序列化

```bash
# 序列化环境到文件
{"cmd": "pickle environment", "path": "env.pickle"}

# 从文件反序列化环境
{"cmd": "unpickle environment", "path": "env.pickle"}

# 序列化证明状态
{"cmd": "pickle proof_state", "path": "state.pickle"}
```

## 命令接口

### 基本命令

| 命令 | 参数 | 描述 | 示例 |
|------|------|------|------|
| `cmd` | 代码字符串 | 执行 Lean 代码 | `{"cmd": "def x := 1"}` |
| `tactic` | 策略字符串 | 应用策略 | `{"tactic": "simp"}` |
| `pickle` | 路径 | 序列化状态 | `{"cmd": "pickle env", "path": "e.pkl"}` |
| `unpickle` | 路径 | 反序列化状态 | `{"cmd": "unpickle env", "path": "e.pkl"}` |
| `print` | 选项 | 打印信息 | `{"cmd": "print goals"}` |

### JSON 输出格式

```json
{
  "messages": [
    {
      "severity": "info",
      "caption": "message caption",
      "text": "message text"
    }
  ],
  "goals": [
    {
      "target": "1 + 1 = 2",
      "hypothese": ["n : Nat"]
    }
  ],
  "environment": {
    "constants": [...],
    "axioms": [...]
  },
  "infotree": {
    "nodes": [...]
  }
}
```

## 使用示例

### Python 客户端

```python
import json
import subprocess

# 启动 REPL 进程
proc = subprocess.Popen(
    ['lake', 'repl'],
    stdin=subprocess.PIPE,
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
    text=True,
    bufsize=1
)

def send_command(cmd):
    """发送命令并接收响应"""
    proc.stdin.write(json.dumps(cmd) + '\n')
    proc.stdin.flush()
    response = proc.stdout.readline()
    return json.loads(response)

# 执行 Lean 代码
result = send_command({"cmd": "def x := 42"})
print(result)

# 执行证明
result = send_command({
    "cmd": "theorem test : True := by trivial"
})
print(result)

# 应用策略
result = send_command({
    "cmd": "theorem test2 (n : Nat) : n < n + 1 := by"
})
result = send_command({"tactic": "omega"})
print(result)

# 关闭进程
proc.terminate()
```

### Node.js 客户端

```javascript
const { spawn } = require('child_process');

// 启动 REPL 进程
const repl = spawn('lake', ['repl']);

// 监听输出
repl.stdout.on('data', (data) => {
  console.log(`Output: ${data}`);
});

// 发送命令
function sendCommand(cmd) {
  repl.stdin.write(JSON.stringify(cmd) + '\n');
}

// 使用示例
sendCommand({cmd: "def x := 42"});
sendCommand({cmd: "#check x"});

// 关闭
repl.terminate();
```

### LeanDojo 集成示例

```python
from lean_dojo import LeanGitRepo, traced_pos

# LeanDojo 使用 REPL 与 Lean 交互
repo = LeanGitRepo("https://github.com/leanprover-community/mathlib4")

# 提取数据
traced_repo = repo.traced_repo

# 访问定理和证明
for theorem in traced_repo.theorems:
    print(f"Theorem: {theorem.name}")
    print(f"Proof: {theorem.proof}")
```

## 目录结构

```
repl/
├── REPL/
│   ├── Frontend.lean      # 前端接口
│   ├── JSON.lean          # JSON 序列化
│   ├── Main.lean          # 主程序
│   ├── Snapshots.lean     # 快照管理
│   ├── Lean/
│   │   ├── ContextInfo.lean   # 上下文信息
│   │   ├── Environment.lean   # 环境管理
│   │   └── InfoTree.lean      # 信息树
│   └── Util/
│       ├── Path.lean      # 路径工具
│       └── Pickle.lean    # 序列化工具
└── test/                   # 测试用例
    ├── all_tactics.in
    ├── proof_step.in
    ├── pickle_environment.in
    ├── infotree.in
    └── ...
```

## 使用场景

### 1. AI/ML 集成

```python
# 机器学习训练数据提取
def extract_training_data(lean_file):
    proc = start_repl()
    
    # 加载文件
    send_command(proc, {"cmd": f"import {lean_file}"})
    
    # 提取定理和证明
    theorems = []
    for thm in get_theorems(proc):
        theorems.append({
            "name": thm.name,
            "statement": thm.statement,
            "proof": thm.proof
        })
    
    return theorems
```

### 2. 证明自动化

```python
# 自动证明搜索
def auto_prove(goal):
    proc = start_repl()
    
    # 设置目标
    send_command(proc, {"cmd": f"example : {goal} := by"})
    
    # 尝试不同策略
    tactics = ["simp", "aesop", "omega", "linarith", "ring"]
    for tac in tactics:
        result = send_command(proc, {"tactic": tac})
        if result.get("goals") == []:
            return tac
    
    return None
```

### 3. IDE 集成

```python
# 语言服务器协议
class LeanLanguageServer:
    def __init__(self):
        self.repl = start_repl()
    
    def hover(self, file, line, col):
        # 获取类型信息
        cmd = {
            "cmd": f"#check {get_expr_at(file, line, col)}"
        }
        return send_command(self.repl, cmd)
    
    def completion(self, file, line, col):
        # 获取补全建议
        cmd = {
            "cmd": f"complete {get_prefix_at(file, line, col)}"
        }
        return send_command(self.repl, cmd)
```

### 4. 测试框架

```python
# 自动化测试
def run_tests(test_file):
    proc = start_repl()
    
    # 加载测试文件
    send_command(proc, {"cmd": f"import {test_file}"})
    
    # 运行所有测试
    results = []
    for test in get_tests(proc):
        result = send_command(proc, {"cmd": f"run_test {test}"})
        results.append((test, result))
    
    return results
```

## 高级特性

### 信息树

```bash
# 获取信息树
{"cmd": "theorem test : True ∧ False := by constructor"}
{"cmd": "infotree"}

# 输出包含完整的证明结构
{
  "infotree": {
    "node": "Tactic",
    "children": [
      {"node": "Apply", "goal": "True"},
      {"node": "Apply", "goal": "False"}
    ]
  }
}
```

### 环境快照

```bash
# 保存当前环境状态
{"cmd": "pickle environment", "path": "checkpoint1.pickle"}

# 修改环境
{"cmd": "def y := 43"}

# 恢复到之前的状态
{"cmd": "unpickle environment", "path": "checkpoint1.pickle"}
```

### 证明状态管理

```bash
# 保存证明状态
{"cmd": "pickle proof_state", "path": "proof_state1.pickle"}

# 继续证明
{"tactic": "simp"}

# 如果走错路,可以回退
{"cmd": "unpickle proof_state", "path": "proof_state1.pickle"}
```

## 测试

### 运行测试

```bash
# 运行所有测试
./test.sh

# 运行单个测试
lake repl < test/proof_step.in

# 测试序列化
lake repl < test/pickle_environment.in
```

### 测试用例类型

```
test/
├── all_tactics.in           # 策略测试
├── proof_step.in            # 证明步骤测试
├── pickle_environment.in    # 环境序列化测试
├── pickle_proof_state.in    # 证明状态序列化测试
├── infotree.in              # 信息树测试
├── variables.in             # 变量处理测试
└── Mathlib/                 # Mathlib 相关测试
```

## 性能优化

### 1. 环境缓存

```python
# 缓存环境避免重复加载
class EnvironmentCache:
    def __init__(self):
        self.cache = {}
    
    def get_environment(self, imports):
        key = tuple(imports)
        if key not in self.cache:
            proc = start_repl()
            for imp in imports:
                send_command(proc, {"cmd": f"import {imp}"})
            self.cache[key] = proc
        return self.cache[key]
```

### 2. 批量处理

```python
# 批量执行命令
def batch_execute(commands):
    proc = start_repl()
    results = []
    for cmd in commands:
        result = send_command(proc, cmd)
        results.append(result)
    return results
```

## 相关资源

- **GitHub**: https://github.com/leanprover-community/repl
- **LeanDojo**: https://leandojo.org
- **社区**: https://leanprover.zulipchat.com

## 常见问题

### Q: REPL 启动慢?

**A**: 
1. 预编译依赖库
2. 使用环境缓存
3. 减少 import

### Q: 如何处理大文件?

**A**:
1. 分块处理
2. 使用快照功能
3. 定期清理环境

### Q: 如何调试 REPL?

**A**:
1. 启用详细输出
2. 检查 JSON 格式
3. 使用简单的测试用例

---

**最后更新**: 2026-04-01
