# 项目优化计划与进度

## 优化目标

1. **消除重复**: 合并重复的词典目录
2. **统一命名**: 采用中文命名为主，英文为辅
3. **优化内容**: 删除冗余，改进描述方式
4. **重组结构**: 建立清晰的目录层次

## 当前问题

### 1. 重复目录

| 重复组 | 保留 | 删除/合并 |
|--------|------|-----------|
| philosophy-dictionary / philosophy_dictionary | philosophy-dictionary | philosophy_dictionary |
| education_dictionary / education-dictionary | education_dictionary | - |
| literature_dictionary / 文学知识词典 | 文学知识词典 | literature_dictionary |
| economics-dict / economics-dictionary | economics-dictionary | economics-dict |

### 2. 命名不统一

- 有中文名（法学词典）
- 有英文名（economics-dictionary）
- 有混合名（economics-dict）

### 3. 冗余文件

- 临时文件（词典优化计划.md等）
- 空白README
- 重复内容

## 优化策略

### Phase 1: 目录整理
- [ ] 合并重复目录
- [ ] 统一命名规范
- [ ] 删除空目录

### Phase 2: 内容优化
- [ ] 检查每个词典的README
- [ ] 优化词条描述方式
- [ ] 删除重复内容
- [ ] 补充缺失内容

### Phase 3: 结构优化
- [ ] 建立统一模板
- [ ] 优化目录结构
- [ ] 更新主索引

## 命名规范

### 目录命名
- **主要词典**: 中文名（如：法学词典、军事学词典）
- **技术词典**: 英文名（如：tech-dictionary）
- **特殊词典**: 可保留现有名称

### 文件命名
- **模块文件**: `XX_模块名.md`（如：01_法理学.md）
- **README**: 统一使用 `README.md`
- **索引文件**: `INDEX.md` 或 `索引.md`

## 进度记录

### 2026-03-27
- 创建优化计划
- 开始目录整理
