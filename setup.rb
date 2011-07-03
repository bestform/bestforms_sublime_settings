userRessources = [
  "submodules/adzenithPlugins/scroll_offset.py"
]

packages = [
  "submodules/RyanOnRails/Ryan On Rails"
]

def isWindows?
  ENV['OS'] == "Windows_NT"  
end

userRessources.each do |r|
  target = File.basename r
  if File.exists? target
    File.unlink target
  end
  File.symlink r, target
end

packages.each do |p|
  target = "../" + (File.basename p)
  if File.exists? target
    File.unlink target
  end
  File.symlink "User/" + p, target
end