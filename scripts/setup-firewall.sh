#!/bin/bash
# FlexBV Firewall Blocker
# Blocks FlexBV activation servers for offline use
# Source: https://github.com/SasoriXX/CipherHater/blob/master/flexbv.md

# FlexBV hosts to block
FLEXBV_HOSTS=("27.50.89.128")

echo "=========================================="
echo "  FlexBV Firewall Block Script"
echo "=========================================="
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or with sudo"
    echo "Usage: sudo $0"
    exit 1
fi

# Block using iptables (works on most Linux systems)
echo "[1/3] Blocking FlexBV hosts with iptables..."

for host in "${FLEXBV_HOSTS[@]}"; do
    # Check if rule already exists
    if ! iptables -C OUTPUT -d "$host/32" -j REJECT 2>/dev/null; then
        iptables -A OUTPUT -d "$host/32" -j REJECT
        echo "  Blocked: $host"
    else
        echo "  Already blocked: $host"
    fi
done

# Try UFW if available (Ubuntu/Debian)
if command -v ufw &> /dev/null; then
    echo ""
    echo "[2/3] Blocking with UFW (Ubuntu/Debian)..."
    for host in "${FLEXBV_HOSTS[@]}"; do
        ufw insert 1 deny out to "$host/32" comment 'FlexBV-block' 2>/dev/null || true
        ufw insert 1 deny in from "$host/32" comment 'FlexBV-block' 2>/dev/null || true
        echo "  UFW rule added for: $host"
    done
done

# Save iptables rules (for persistence)
echo ""
echo "[3/3] Saving firewall rules..."

# Try different methods to save rules
if command -v iptables-save &> /dev/null; then
    # Debian/Ubuntu
    if [ -d /etc/iptables ]; then
        iptables-save > /etc/iptables/rules.v4
        echo "  Rules saved to /etc/iptables/rules.v4"
    # RHEL/CentOS
    elif [ -d /etc/sysconfig/iptables ]; then
        iptables-save > /etc/sysconfig/iptables
        echo "  Rules saved to /etc/sysconfig/iptables"
    fi
fi

# Try iptables-persistent if installed
if command -v netfilter-persistent &> /dev/null; then
    netfilter-persistent save 2>/dev/null || true
    echo "  Rules saved via netfilter-persistent"
fi

echo ""
echo "=========================================="
echo "  Firewall blocks applied!"
echo "=========================================="
echo ""
echo "Blocked hosts:"
for host in "${FLEXBV_HOSTS[@]}"; do
    echo "  - $host"
done
echo ""
echo "To verify blocks:"
echo "  sudo iptables -L OUTPUT -n | grep FlexBV"
echo ""
echo "To unblock later:"
echo "  sudo iptables -D OUTPUT -d 27.50.89.128/32 -j REJECT"
echo ""
