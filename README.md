# homebrew-tap

Homebrew tap for [pafw](https://github.com/jiiro974/pafw-releases) - CLI tools for Palo Alto Networks firewalls.

## Install

```
brew tap jiiro974/tap
brew install pafw
```

## Commands

| Command | Description |
|---------|-------------|
| `pafw` | Main command (subcommands: ping, trace, if, route, arp, session, fib, counter, cap) |
| `paping` | Ping from firewall |
| `patrace` | Traceroute from firewall |
| `paif` | Show interfaces |
| `paroute` | Show routing table |
| `paarp` | Show ARP table |
| `pasession` | Show sessions |
| `pafib` | FIB lookup |
| `pacounter` | Show global counters |
| `pacap` | Packet capture |

## Update

```
brew update
brew upgrade pafw
```
