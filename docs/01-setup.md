# Instalação e Setup

Antes de começarmos a trabalhar com Git e GitHub, precisas de instalar e configurar algumas ferramentas. Não te preocupes - vamos fazer isto passo a passo!

## 📋 O que vamos instalar

1. **Git** - O sistema de controlo de versões
2. **Positron** - O IDE para trabalhar com R
3. **R** - A linguagem de programação (se ainda não tiveres)
4. **Conta no GitHub** - Para hospedar os teus projetos online

---

## 1️⃣ Instalar o Git

O Git é o software que gere as versões do teu código. É como um sistema de "desfazer" super-potente para todo o teu projeto.

### Para Windows

1. Vai a [git-scm.com/download/win](https://git-scm.com/download/win)
2. Descarrega o instalador
3. Executa o instalador com as opções padrão
4. **Importante**: Quando perguntarem qual editor usar, podes escolher qualquer um (não vamos usar muito)

### Para macOS

**Opção 1 - Homebrew (recomendado se já usas):**
```bash
brew install git
```

**Opção 2 - Instalador:**
1. Vai a [git-scm.com/download/mac](https://git-scm.com/download/mac)
2. Descarrega e instala

### Para Linux

```bash
# Ubuntu/Debian
sudo apt-get install git

# Fedora
sudo dnf install git
```

### ✅ Verificar a instalação

Abre o terminal (Command Prompt no Windows, Terminal no macOS/Linux) e escreve:

```bash
git --version
```

Deves ver algo como: `git version 2.40.0` (o número pode ser diferente)

---

## 2️⃣ Instalar o Positron

O Positron é um IDE moderno para ciência de dados, construído pela equipa do RStudio/Posit.

1. Vai a [github.com/posit-dev/positron](https://github.com/posit-dev/positron)
2. Vai para "Releases" na barra lateral direita
3. Descarrega a versão mais recente para o teu sistema operativo
4. Instala como qualquer outro programa

**Nota**: O Positron está em desenvolvimento ativo. Se preferires, podes usar o RStudio - este tutorial funciona em ambos!

---

## 3️⃣ Instalar o R

Se ainda não tens o R instalado:

1. Vai a [cran.r-project.org](https://cran.r-project.org/)
2. Escolhe o teu sistema operativo
3. Descarrega e instala a versão mais recente (4.3.0 ou superior)

### ✅ Verificar a instalação

Abre o Positron ou R e escreve:

```r
R.version.string
```

---

## 4️⃣ Criar conta no GitHub

O GitHub é onde vais hospedar os teus projetos e colaborar com outros.

1. Vai a [github.com](https://github.com)
2. Clica em "Sign up"
3. Segue os passos:
   - Escolhe um username (pode ser profissional, vais usar isto no trabalho!)
   - Usa o teu email profissional
   - Cria uma password forte
   - Verifica o email

**Dica**: Escolhe um username profissional - vai aparecer em todo o teu trabalho!

---

## 5️⃣ Instalar pacotes R necessários

Abre o Positron/RStudio e instala os pacotes que vamos usar:

```r
# Pacotes para análise de dados
install.packages("tidyverse")

# Para relatórios
install.packages("quarto")

# Útil para trabalhar com Git no R
install.packages("usethis")
```

Este processo pode demorar alguns minutos. É normal!

---

## 6️⃣ Configurar integração Git no Positron

O Positron tem integração nativa com Git. Vamos garantir que está tudo a funcionar:

1. Abre o Positron
2. Vai a **File → New Project**
3. Escolhe **Version Control → Git**
4. Se vires esta opção, está tudo OK! (Não precisas de criar o projeto agora)

---

## ✅ Checklist Final

Antes de avançares, confirma que tens tudo:

- [ ] Git instalado (verificado com `git --version`)
- [ ] Positron instalado e a funcionar
- [ ] R instalado (versão 4.3.0+)
- [ ] Conta no GitHub criada e email verificado
- [ ] Pacotes R instalados (tidyverse, quarto, usethis)
- [ ] Integração Git no Positron a funcionar

---

## 🆘 Problemas?

### Git não é reconhecido no terminal
- **Windows**: Reinicia o computador após instalação
- **macOS/Linux**: Pode ser necessário adicionar Git ao PATH

### Positron não abre
- Verifica se tens permissões de administrador
- Tenta descarregar novamente o instalador

### Pacotes R não instalam
- Verifica a tua ligação à internet
- Tenta instalar um de cada vez
- Verifica se tens a versão mais recente do R

---

## 🎉 Próximo passo

Tudo instalado? Ótimo! Agora vamos [configurar o Git](02-configuracao-inicial.md) com a tua informação pessoal.
