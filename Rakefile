task :build do
  sh "docker build -t unfs3_build ."
  id = `docker create unfs3_build bash`.strip
  sh "docker cp #{id}:/home/vcap/app/bin/fuse-nfs target/bin"
  sh "docker cp #{id}:/home/vcap/app/lib/libnfs.so.8.1.0 target/lib"
  sh "cd target/lib && mv libnfs.so.8.* libnfs.so.8"
  sh "docker stop #{id}"
end
