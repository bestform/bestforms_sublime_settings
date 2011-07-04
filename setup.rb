USERRESSOURCES = [
  "submodules/adzenithPlugins/scroll_offset.py"
]

PACKAGES = [
  "submodules/RyanOnRails/Ryan On Rails",
  "nonGitPackages/ZenCoding"
]

TARGETPACKAGE = "../bestform"

def isWindows?
  ENV['OS'] == "Windows_NT"  
end

def removeDir(directory)
  entries = Dir.entries(directory).reverse
  2.times {entries.pop}
  entries.each do |e|
    entry = File.join directory, e
    if !File.directory? entry
      File.unlink entry
    else
      removeDir entry
    end
  end
  Dir.rmdir directory
end

if Dir.exists? TARGETPACKAGE
  removeDir(TARGETPACKAGE)  
end

Dir.mkdir TARGETPACKAGE

USERRESSOURCES.each do |r|
  target = File.join TARGETPACKAGE, (File.basename r)
  File.symlink "../User/" + r, target
end

PACKAGES.each do |p|
  target = "../" + (File.basename p)
  if File.exists? target
    File.unlink target
  end
  File.symlink "User/" + p, target
end