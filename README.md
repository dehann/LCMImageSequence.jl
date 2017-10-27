# LCMImageSequence.jl
Convert LCM image streams to Julia Images.jl type




# Install

To use a Java enabled LCMCore, you can install a fork of LCMCore.jl first:
```
Pkg.clone("https://github.com/dehann/LCMCore.jl.git")
Pkg.clone("https://github.com/dehann/LCMImageSequence.jl.git")
```

# Usage

This package uses a sandbox install of [LCM](https://lcm-proj.github.io/).
Required environment variables are loaded with a "per terminal" load script `env-setup.sh`. 
