# Raycast AWS Login

Simply login to an AWS service and account (profile)
through [raycast](https://www.raycast.com/). Uses assume (by [granted](https://docs.commonfate.io/granted/introduction)) to login.

# Requirements
- [granted](https://docs.commonfate.io/granted/getting-started)

```bash
brew tap common-fate/granted
brew install granted
```

- [raycast](https://formulae.brew.sh/cask/raycast)

```bash
brew install --cask raycast
```

- [python](https://www.python.org/) >= `3.6`

# Installation

1. Clone this repo to `~/.raycast/`
    ```bash
    git clone https://github.com/davidgfitzgerald/raycast-assume ~/.raycast/scripts
    ```
2. Tell raycast to look in `~/.raycast/scripts` for scripts
   1. `Cmd + Space` (to open raycast)
   2. `Cmd + ,` (to configure raycast)
   3. Navigate to `Extensions` -> `Scripts`
   4. Click on `Script Commands`
   5. Click `Add Directories` and add `~/.raycast/scripts`

## Dropdown Population

The AWS Profile dropdown must be populated manually and 
can be generated from a python script by
simply running:

```bash
python utils/profile_extractor.py
```

This will generate `profiles.json`. The contents of this 
file must be copied into the `data` of the `Profile` argument
in [aws.sh](aws.sh).

# Usage
1. `Cmd + Space` (to open raycast)
2. `login` (type `login`)
3. Choose service + account from dropdown
4. Browser opens AWS to that service + account

# Notes

The Service dropdown arguments are populated from here:
  https://github.com/fwdcloudsec/granted/blob/main/pkg/console/service_map.go
