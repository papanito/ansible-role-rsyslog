# ansible-rsyslog

Ansible role to forward syslog to a log service like [Loggly.com](https://loggly.com) or [Logz.io](https://logz.io). The role also forwards the systemd logs to syslog. Details regarding the syslog configuration can be found here:

* [Loggly.com](https://www.loggly.com/docs/systemd-logs/)
* [Logz.io](https://app.logz.io/#/dashboard/data-sources/rsyslog-overTLS)

## Remark

This role is based on the role from [jmcvetta/ansible-loggly](https://github.com/jmcvetta/ansible-loggly)

## Requirements

Respective account for the logging serivce and a token

## Role Variables

There are common role variables and service specfic ones. Most variables should be fine (as tested). Thus it's recommended to only define these variables

```yaml
rsyslog_srv:       logz.io # set this to use the correct service
rsyslog_tls:       true # or false in case you want plaintext
rsyslog_tag:       syslog
rsyslog_token:     YOUR_TOKEN_GOES_HERE
rsyslog_cert:      rsyslog.crt
```

## Dependencies

n/a

## Testing

Assumes you have Ruby and Bundler already installed.

```bash
bundle install  # Only required once
bundle exec kitchen test
```

## Example Playbook

```yml
- name: Forward server logs to rsyslog service
  hosts: "servers"
  vars:
    rsyslog_srv: logz.io
    rsyslog_tls: true
    rsyslog_tag: syslog
    rsyslog_token: xxxxxxxxxxxxxxxxxxxxxxxx

  roles:
     - papanito.rsyslog
```

## License

This is Free Software, released under the terms of the Apache v2 license.