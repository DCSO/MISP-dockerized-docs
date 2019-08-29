# Multiple NICs at the Docker Host

If you have multiple NICs at your Docker host this can run into issues.
One source of solving can be this blog post: https://williamsbdev.com/posts/docker-connection-marking/

The base problem is that Docker creates IPtable rules but IPtables are always problematic if they are not interface-less created.