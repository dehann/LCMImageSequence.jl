# LCMImageSequence.jl

Convert LCM image streams to [Julia](http://www.julialang.org) ([JuliaPro](http://www.juliacomputing.com)) [Images.jl](http://github.com/JuliaImages/Images.jl/) type, or interface camera hardware using [VideoIO](http://github.com/kmsquire/VideoIO.jl) and publish image traffic.

TODO: This package should expose the VideoIO direct API for access to the same image structure without LCM transport.

# Install

To use a Java enabled LCMCore, you can install a fork of LCMCore.jl first:
```
Pkg.clone("https://github.com/dehann/LCMCore.jl.git")
Pkg.clone("https://github.com/dehann/LCMImageSequence.jl.git")
```

# Usage

This package uses a sandbox install of [LCM](https://lcm-proj.github.io/).
Required environment variables are loaded with a "per terminal" load script `env-setup.sh`.
