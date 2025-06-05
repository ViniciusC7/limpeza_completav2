# 🧹 Script de Limpeza e Manutenção Completa do PC

Um script em **Batch** para Windows que realiza limpeza e manutenção completa do sistema de forma automatizada.

## 🔧 Funcionalidades

### 🛠️ Manutenção do Sistema
- **Verificação de Integridade**: Executa `sfc /scannow` para verificar arquivos do sistema
- **Restauração da Imagem**: Usa `DISM` para corrigir componentes corrompidos do Windows
- **Verificação de Privilégios**: Garante execução como administrador

### 🗑️ Limpeza Completa
- **Arquivos Temporários**: Remove arquivos temp do Windows e usuário
- **Cache Prefetch**: Limpa arquivos de pré-carregamento desnecessários
- **Cache DLL**: Remove cache de bibliotecas dinâmicas
- **Histórico do Navegador**: Limpa histórico e cookies antigos
- **Logs de Eventos**: Limpa todos os registros de eventos do Windows


## 📋 Etapas do Processo

O script executa as seguintes etapas em ordem:

1. **[1/4] Verificação de Integridade dos Arquivos**
   - Executa `sfc /scannow` para detectar e corrigir arquivos corrompidos

2. **[2/4] Restauração da Imagem do Sistema**
   - Executa `DISM /Online /Cleanup-Image /RestoreHealth`
   - Corrige componentes profundos do Windows

3. **[3/4] Limpeza de Arquivos**
   - Remove arquivos temporários, cache e dados desnecessários
   - Limpa múltiplos diretórios do sistema e usuário

4. **[4/4] Limpeza de Logs**
   - Remove todos os registros de eventos do Windows
   - Libera espaço e melhora performance

## ⚠️ Avisos Importantes

- **SEMPRE execute como administrador** - o script não funcionará sem privilégios elevados
- **Feche outros programas** antes da execução para evitar conflitos
- **Faça backup** de dados importantes antes da primeira execução
- **O processo pode demorar** - especialmente as etapas de SFC e DISM

## 🔒 Segurança

Este script:
- ✅ **NÃO modifica** arquivos pessoais ou documentos
- ✅ **NÃO instala** ou remove programas
- ✅ **Apenas limpa** arquivos temporários e de sistema seguros
- ✅ **Usa comandos nativos** do Windows (SFC, DISM, DEL)

## 📊 Benefícios

- **🚀 Melhora a performance** removendo arquivos desnecessários
- **💾 Libera espaço em disco** significativo
- **🔧 Corrige problemas** de integridade do sistema
- **🧹 Automatiza** tarefas de manutenção manuais
- **⏱️ Economiza tempo** em manutenção regular

