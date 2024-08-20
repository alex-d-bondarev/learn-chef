# learn-chef

> [!NOTE]  
> **Archived** since I have learned what I planned to an no longer plan to commit new changes

You can copy and reuse code [![MIT License](http://img.shields.io/badge/license-MIT-green.svg)](https://github.com/selenide/selenide/blob/master/LICENSE)

Added for QAOps [presentation](https://docs.google.com/presentation/d/1Bz0TQVtgx93XDXwBTPgPtaufhDMom7q_4hrNiiMxmcg/edit?usp=sharing)

## Preconditions

1. Install chefDK from [this link](https://downloads.chef.io/chefdk/stable/) (these examples were implemented for chef 3.0.36 version)
1. Install Vagrant from [this link](https://www.vagrantup.com/)
1. Install Virtualbox from [this link](https://www.virtualbox.org/wiki/Downloads)

## Steps that were run in order to get the [mydatabase](./mydatabase)

1. `chef generate cookbook mydatabase`. 
1. \[Alternative for tests #1] create mydatabase folder and run `kitchen init` there.
1. \[Alternative for tests #2] create mydatabase folder and run `chef exec rspec init` there.

## Unit tests

Unit tests run in memory without deploying recipe to VM

### Run tests

1. `chef exec rspec` - quick run
1. `chef exec rspec --format documentation` - with details

## Integration tests

Integration tests run against VM with deployed recipe.

### Verify kitchen (set up/verified/etc.)

1. `cd mydatabase/`
1. `kitchen list`
**Expected:** No errors

### Run tests

1. \[Optional] `kitchen converge` - redeploy cookbook after recipe changes to run kitchen correctly
1. \[Optional] `kitchen login` - verify setup manually
1. `kitchen verify` - create VM, deploy cookbook and run inspec tests

### Investigate inspec resources

1. `inspec shell`
1. `help <resource_name>` (For example: `help postgres_session`)
