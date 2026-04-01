-- IO 操作
def main : IO Unit := do
  IO.println "Hello from Lean4!"

def readAndPrint : IO Unit := do
  let line ← IO.getLine
  IO.println s!"You entered: {line}"

def writeFileExample : IO Unit := do
  let content := "Hello, this is a test file.\nLine 2\nLine 3"
  IO.FS.writeFile "test.txt" content

def readFileExample : IO Unit := do
  let content ← IO.FS.readFile "test.txt"
  IO.println content

def appendToFile : IO Unit := do
  let moreContent := "\nAppended line"
  IO.FS.appendFile "test.txt" moreContent

def listCurrentDir : IO Unit := do
  let entries ← IO.FS.readDir "."
  for entry in entries do
    IO.println entry.fileName

def createAndRemoveDir : IO Unit := do
  IO.FS.createDir "temp_dir"
  IO.println "Directory created"
  IO.FS.removeDir "temp_dir"
  IO.println "Directory removed"

def getCurrentTime : IO Unit := do
  let time ← IO.monoMsNow
  IO.println s!"Current time (ms): {time}"

def sleepExample : IO Unit := do
  IO.println "Starting..."
  IO.sleep 1000000000
  IO.println "Done sleeping!"

def environmentVariable : IO Unit := do
  let path? ← IO.getEnv "PATH"
  match path? with
  | some path => IO.println s!"PATH: {path}"
  | none => IO.println "PATH not found"

#eval main
