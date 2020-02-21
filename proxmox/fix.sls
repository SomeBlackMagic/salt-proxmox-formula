remove_subscription_notice:
  file.replace:
    - name: /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
    - pattern: {{ 'data.status !== \'Active\'' | regex_escape }}
    - repl: 'true'
    - backup: True

full_hostname_in_lxd:
  file.replace:
    - name: /usr/share/perl5/PVE/LXC/Setup/Base.pm
    - pattern: {{ 'my $namepart = ($hostname =~ s/\..*$//r);' | regex_escape }}
    - repl: 'my $namepart = ($hostname);'
    - backup: True

restart_pve_proxy:
  cmd.run:
    - name: 'systemctl restart pveproxy.service'
