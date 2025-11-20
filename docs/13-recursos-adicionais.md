# Recursos Adicionais

Aprende mais sobre Git, GitHub e boas práticas de desenvolvimento colaborativo.

---

## 📚 Tutoriais e Cursos

### Git e GitHub Básico

**Em Português**:
- [Git Book em Português](https://git-scm.com/book/pt-br/v2) - Referência oficial completa
- [GitHub Learning Lab](https://lab.github.com/) - Tutoriais interativos
- [Guia Rápido do GitHub](https://docs.github.com/pt/get-started/quickstart) - Documentação oficial em PT

**Em Inglês**:
- [Learn Git Branching](https://learngitbranching.js.org/) - Tutorial visual e interativo
- [GitHub Skills](https://skills.github.com/) - Cursos práticos gratuitos
- [Atlassian Git Tutorials](https://www.atlassian.com/git/tutorials) - Tutoriais detalhados

### Vídeos

**Em Português**:
- [Git e GitHub para Iniciantes (Curso em Vídeo)](https://www.youtube.com/playlist?list=PLHz_AreHm4dm7ZULPAmadvNhH6vk9oNZA)
- [Git e GitHub na Prática (Rocketseat)](https://www.youtube.com/watch?v=2alg7MQ6_sI)

**Em Inglês**:
- [Git & GitHub Crash Course (Traversy Media)](https://www.youtube.com/watch?v=SWYqp7iY_Tc)
- [Git for Professionals (freeCodeCamp)](https://www.youtube.com/watch?v=Uszj_k0DGsg)

### Cursos Completos

- [GitHub Foundations Certification](https://learn.microsoft.com/training/paths/github-foundations/) - Grátis
- [Version Control with Git (Coursera)](https://www.coursera.org/learn/version-control-with-git)
- [Introduction to Git for Data Science (DataCamp)](https://www.datacamp.com/courses/introduction-to-git)

---

## 🛠️ Ferramentas

### Interfaces Visuais para Git

**Desktop Clients**:
- [GitHub Desktop](https://desktop.github.com/) - Oficial, simples e grátis
- [GitKraken](https://www.gitkraken.com/) - Visual, poderoso (grátis para uso pessoal)
- [Sourcetree](https://www.sourcetreeapp.com/) - Da Atlassian, grátis

**Integrado no IDE**:
- [Positron](https://github.com/posit-dev/positron) - Já tem Git integrado!
- [VSCode](https://code.visualstudio.com/) - Extensão Git Graph
- [RStudio](https://posit.co/products/open-source/rstudio/) - Painel Git integrado

### Extensões Úteis

**VSCode/Positron**:
- **GitLens** - Superpoderes para Git (autor, histórico, etc.)
- **Git Graph** - Visualização gráfica de branches
- **Git History** - Ver histórico de ficheiros

**Chrome/Firefox**:
- **Octotree** - Navegação em árvore para GitHub
- **Refined GitHub** - Melhorias na interface do GitHub

### Utilitários de Terminal

```bash
# Git extras - comandos úteis adicionais
brew install git-extras  # macOS
apt install git-extras   # Linux

# Git LFS - Para ficheiros grandes
git lfs install

# BFG Repo Cleaner - Limpar histórico
# https://rtyley.github.io/bfg-repo-cleaner/
```

---

## 📖 Livros

### Gratuitos Online

- **[Pro Git](https://git-scm.com/book/en/v2)** - Scott Chacon & Ben Straub
  - Referência completa oficial
  - Disponível em PT-BR
  - Grátis online ou comprar físico

- **[Git Flight Rules](https://github.com/k88hudson/git-flight-rules)**
  - Como resolver problemas específicos
  - Formato prático

- **[Learn Version Control with Git](https://www.git-tower.com/learn/git/ebook)**
  - Ebook grátis para iniciantes

### Livros Pagos (Valem a Pena)

- **Version Control with Git** - Jon Loeliger & Matthew McCullough
- **Git Pocket Guide** - Richard E. Silverman
- **Pragmatic Guide to Git** - Travis Swicegood

---

## 🎓 Conceitos Avançados

### Workflows de Equipa

**Git Flow**:
- [Git Flow Cheatsheet](https://danielkummer.github.io/git-flow-cheatsheet/)
- [A successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)

**GitHub Flow**:
- [Understanding GitHub Flow](https://guides.github.com/introduction/flow/)
- Mais simples que Git Flow, ideal para equipas pequenas

**Trunk-Based Development**:
- [Trunk Based Development](https://trunkbaseddevelopment.com/)
- Para equipas que fazem deploy frequente

### Tópicos Avançados

**Rebase vs Merge**:
- [Merging vs. Rebasing (Atlassian)](https://www.atlassian.com/git/tutorials/merging-vs-rebasing)
- Quando usar cada um

**Git Hooks**:
- [Git Hooks Tutorial](https://www.atlassian.com/git/tutorials/git-hooks)
- Automatizar tarefas (linting, tests, etc.)

**Submodules e Subtrees**:
- [Git Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- [Git Subtrees](https://www.atlassian.com/git/tutorials/git-subtree)

---

## 🔐 Segurança e Boas Práticas

### Autenticação

**SSH Keys**:
- [Generating SSH Keys (GitHub)](https://docs.github.com/pt/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- Mais seguro que HTTPS

**Personal Access Tokens**:
- [Creating a PAT](https://docs.github.com/pt/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
- Necessário para HTTPS

**GPG Signing**:
- [Signing Commits](https://docs.github.com/pt/authentication/managing-commit-signature-verification/signing-commits)
- Verificar autoria de commits

### Proteger Dados Sensíveis

**Prevenir**:
- [git-secrets](https://github.com/awslabs/git-secrets) - Prevenir commit de secrets
- [GitGuardian](https://www.gitguardian.com/) - Scan de secrets

**Limpar Histórico**:
- [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/)
- [git-filter-repo](https://github.com/newren/git-filter-repo)

### .gitignore Templates

- [gitignore.io](https://www.toptal.com/developers/gitignore) - Gerar .gitignore
- [GitHub gitignore templates](https://github.com/github/gitignore) - Templates oficiais

---

## 🤝 Colaboração

### Code Review

**Melhores Práticas**:
- [Google's Code Review Guide](https://google.github.io/eng-practices/review/)
- [How to do Code Reviews (Atlassian)](https://www.atlassian.com/agile/software-development/code-reviews)

**Ferramentas**:
- [GitHub Pull Requests](https://docs.github.com/pt/pull-requests)
- [Conventional Comments](https://conventionalcomments.org/) - Padronizar comentários

### Mensagens de Commit

**Convenções**:
- [Conventional Commits](https://www.conventionalcommits.org/pt-br/)
- [Semantic Commit Messages](https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716)
- [Como escrever boas mensagens](https://chris.beams.io/posts/git-commit/)

**Exemplos**:
```bash
feat: adicionar análise regional
fix: corrigir cálculo de média
docs: atualizar README
refactor: simplificar função de import
test: adicionar testes para análise
```

---

## 🔬 Git para Ciência de Dados

### Workflows Específicos

**R**:
- [Happy Git with R](https://happygitwithr.com/) - Jenny Bryan
- [Git for R Users](https://www.dataquest.io/blog/git-r-tutorial/)
- [usethis package](https://usethis.r-lib.org/) - Facilita uso de Git em R

**Python**:
- [Git for Data Science](https://www.datacamp.com/tutorial/git-for-data-science)
- [Cookiecutter Data Science](https://drivendata.github.io/cookiecutter-data-science/)

**Jupyter Notebooks**:
- [nbdime](https://nbdime.readthedocs.io/) - Diff e merge para notebooks
- [ReviewNB](https://www.reviewnb.com/) - Code review para notebooks

### Data Version Control (DVC)

- [DVC Documentation](https://dvc.org/doc)
- Versionar dados grandes com Git
- Integração com cloud storage

---

## 🎯 GitHub Features Avançadas

### GitHub Actions

**CI/CD para R**:
- [R-lib Actions](https://github.com/r-lib/actions)
- Automatizar testes, checks, deployment

**Exemplos**:
- Renderizar Quarto automaticamente
- Rodar testes em cada PR
- Publicar package em cada release

### GitHub Projects

- [About Projects](https://docs.github.com/pt/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects)
- Gestão de tarefas integrada

### GitHub Pages

- [GitHub Pages](https://pages.github.com/)
- Hospedar sites estáticos grátis
- Ideal para relatórios HTML

---

## 💬 Comunidades

### Fóruns e Discussões

- [GitHub Community](https://github.community/)
- [Stack Overflow - Git tag](https://stackoverflow.com/questions/tagged/git)
- [r/git (Reddit)](https://www.reddit.com/r/git/)

### Portugal/Português

- [Portugal R User Group](https://www.meetup.com/pt-BR/Lisbon-R-Users-Group/)
- [Dados Abertos Portugal](https://dadosabertos.pt/)

---

## 🎮 Aprender Fazendo

### Desafios Interativos

- [Learn Git Branching](https://learngitbranching.js.org/) - Tutorial visual interativo
- [Git Katas](https://github.com/eficode-academy/git-katas) - Exercícios práticos
- [Oh My Git!](https://ohmygit.org/) - Jogo para aprender Git

### Projetos Práticos

**Ideias para praticar**:
1. Contribuir para open source
2. Criar biblioteca R própria
3. Manter repositório de análises pessoais
4. Participar em hackatons
5. Criar portfolio de projetos

---

## 🔍 Troubleshooting

### Recursos para Resolver Problemas

- [Git Flight Rules](https://github.com/k88hudson/git-flight-rules)
- [Oh Shit, Git!?!](https://ohshitgit.com/) - Soluções rápidas
- [Dangit, Git!?!](https://dangitgit.com/) - Versão SFW do anterior

### Stack Overflow

Pesquisar problemas:
- Tag: `[git]`
- Tag: `[github]`
- Tag: `[r] [git]` (para questões R+Git)

---

## 📊 Visualização e Análise

### Ferramentas de Visualização

- [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph)
- [GitKraken](https://www.gitkraken.com/) - Visualização de branches
- [Git History Visualizer](https://github.com/pomber/git-history)

### Estatísticas de Repositório

- [GitHub Insights](https://docs.github.com/pt/repositories/viewing-activity-and-data-for-your-repository/viewing-a-summary-of-repository-activity)
- [git-stats](https://github.com/IonicaBizau/git-stats)
- [GitInspector](https://github.com/ejwa/gitinspector)

---

## 🏆 Certificações

**GitHub**:
- [GitHub Foundations Certification](https://examregistration.github.com/certification/GHF)
- [GitHub Actions Certification](https://examregistration.github.com/certification/GHA)

**Outros**:
- [Git for Version Control (Coursera)](https://www.coursera.org/learn/version-control-with-git)

---

## 📱 Apps Mobile

- **Working Copy** (iOS) - Git client para iPad/iPhone
- **MGit** (Android) - Git client para Android
- **GitHub Mobile** - App oficial do GitHub

---

## 🎓 Para Continuar a Aprender

### Próximos Passos

1. **Dominar conceitos básicos**
   - Praticar workflow diário
   - Fazer commits descritivos
   - Colaborar em PRs

2. **Explorar funcionalidades intermédias**
   - Rebase vs merge
   - Interactive rebase
   - Git hooks

3. **Tópicos avançados**
   - Workflows complexos
   - Git internals
   - Performance optimization

4. **Especialização**
   - CI/CD
   - Git em Data Science
   - Open source contribution

---

## 📧 Manter-se Atualizado

**Newsletters**:
- [GitHub Blog](https://github.blog/)
- [Git Rev News](https://git.github.io/rev_news/)

**Podcasts**:
- The Changelog - Episódios sobre Git
- Software Engineering Daily

**YouTube Channels**:
- [GitHub](https://www.youtube.com/github)
- [Fireship](https://www.youtube.com/c/Fireship) - Tutoriais rápidos

---

## 💡 Dica Final

**A melhor forma de aprender Git é usar!**

- Cria projetos pessoais
- Contribui para open source
- Colabora com colegas
- Não tenhas medo de errar (Git permite desfazer quase tudo!)

---

**Boa sorte na tua jornada com Git e GitHub!** 🚀

Tens dúvidas? [Abre uma issue](../../issues) neste repositório!
