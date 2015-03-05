# textsecure-cookbook

Builds and installs the
[TextSecure-Server](https://github.com/WhisperSystems/TextSecure-Server/).
It is intended for testing purposes and not production environments.

**Note:** This cookbook is not yet functional. It does not start the
service running yet, and several dependencies are missing.

## Supported Platforms

* Ubuntu 14.04

## Attributes

TODO.

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['textsecure']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### textsecure::default

Builds TextSecure server jar and installs dependencies.

### textsecure::database

Installs and configures PostgreSQL.

## Testing

This cookbook can be tested with Vagrant.

```
vagrant plugin install vagrant-cachier # Optional
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
vagrant up
```

## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)
