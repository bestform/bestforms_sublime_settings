USERRESSOURCES = [
  "submodules/adzenithPlugins/scroll_offset.py"
]

PACKAGES = [
  "submodules/RyanOnRails/Ryan On Rails"
]

TARGETPACKAGE = "../bestform"

def isWindows?
  ENV['OS'] == "Windows_NT"  
end



if Dir.exists? TARGETPACKAGE
  Dir.rmdir TARGETPACKAGE
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