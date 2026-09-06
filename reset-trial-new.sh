#!/bin/bash

set -e

echo "=== RESET COMPLETO DO NAVICAT PREMIUM (TRIAL) ==="
echo "ATENÇÃO: Isso removerá todas as preferências, cache e dados de registro."
echo "Suas conexões salvas (em Profiles) serão mantidas (backup será feito)."
read -p "Deseja continuar? (s/N): " confirm
if [[ ! "$confirm" =~ ^[Ss]$ ]]; then
    echo "Cancelado."
    exit 0
fi

# Mata o Navicat
if pgrep -x "Navicat Premium" >/dev/null; then
    echo "Encerrando Navicat Premium..."
    killall "Navicat Premium" 2>/dev/null || true
    sleep 2
fi

# Define variáveis
plist_file="com.navicat.NavicatPremium"
plist_path="$HOME/Library/Preferences/$plist_file.plist"
support_root="$HOME/Library/Application Support/PremiumSoft CyberTech"
support_path="$support_root/Navicat CC/Navicat Premium"

# Backup do plist
if [[ -f "$plist_path" ]]; then
    backup_plist="$plist_path.backup_$(date +%Y%m%d_%H%M%S)"
    cp "$plist_path" "$backup_plist"
    echo "Backup do plist criado em $backup_plist"
fi

# Backup da pasta Profiles (se existir)
if [[ -d "$support_path/Profiles" ]]; then
    backup_profiles="$HOME/Desktop/Navicat_Profiles_$(date +%Y%m%d_%H%M%S)"
    cp -R "$support_path/Profiles" "$backup_profiles"
    echo "Backup de Profiles criado em $backup_profiles"
fi

# Remove o plist
if [[ -f "$plist_path" ]]; then
    echo "Removendo $plist_path"
    rm -f "$plist_path"
fi

# Remove todo o diretório de suporte (exceto Profiles, que será movido de volta depois)
if [[ -d "$support_path" ]]; then
    echo "Removendo $support_path (mantendo Profiles)"
    # Move Profiles para um local temporário
    temp_profiles="/tmp/navicat_profiles_$$"
    if [[ -d "$support_path/Profiles" ]]; then
        mv "$support_path/Profiles" "$temp_profiles"
    fi
    rm -rf "$support_path"
    mkdir -p "$support_path"
    if [[ -d "$temp_profiles" ]]; then
        mv "$temp_profiles" "$support_path/Profiles"
        echo "Profiles restaurados."
    fi
fi

# Remove outros possíveis diretórios
for dir in "$HOME/Library/Application Support/Navicat Premium" \
           "$HOME/Library/Application Support/Navicat" \
           "$HOME/Library/Containers/com.navicat.NavicatPremium" \
           "$HOME/Library/Group Containers/"*navicat*; do
    if [[ -d "$dir" ]]; then
        echo "Removendo $dir"
        rm -rf "$dir"
    fi
done

# Remove caches
cache_path="$HOME/Library/Caches/com.navicat.NavicatPremium"
if [[ -d "$cache_path" ]]; then
    echo "Removendo cache: $cache_path"
    rm -rf "$cache_path"
fi

# Remove keychain
echo "Removendo entrada do Keychain..."
security delete-generic-password -s "com.navicat.NavicatPremium" 2>/dev/null && echo "Entrada removida." || echo "Nenhuma entrada encontrada."

echo "Reset completo finalizado. Reinicie o Navicat Premium."