# learn-chef
Added for QAOps [presentation](https://docs.google.com/presentation/d/1Bz0TQVtgx93XDXwBTPgPtaufhDMom7q_4hrNiiMxmcg/edit?usp=sharing)

## Preconditions

1. Install chefDK from [this link](https://downloads.chef.io/chefdk/stable/)
1. Install Vagrant from [this link](https://www.vagrantup.com/)
1. Install Virtualbox from [this link](https://www.virtualbox.org/wiki/Downloads)

## Steps that were run in order to get the [example](./example)

1. `chef generate cookbook mydatabase`. 
1. \[Alternative for tests #1] create mydatabase folder and run `kitchen init` there.
1. \[Alternative for tests #2] create mydatabase folder and run `chef exec rspec init` there.
