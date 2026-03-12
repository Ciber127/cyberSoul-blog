# ========================================
# CYBERSOUL - SETUP COMPLETO
# Script para configurar blog profesional
# ========================================

Write-Host "🚀 Iniciando configuración de CyberSoul..." -ForegroundColor Cyan

# 1. CREAR LICENCIA Y COPYRIGHT
Write-Host "`n📄 Creando archivo LICENSE..." -ForegroundColor Yellow

$licenseContent = @"
Copyright (c) 2026 CyberSoul (Ciber127)

Todos los derechos reservados.

LICENCIA DE CONTENIDO:
El contenido de este blog (artículos, imágenes, textos) está protegido por 
copyright y NO puede ser reproducido, distribuido o usado comercialmente 
sin permiso explícito por escrito del autor.

LICENCIA DE CÓDIGO:
El código fuente (templates Hugo, configuración) está disponible públicamente 
para referencia y aprendizaje personal únicamente.

Para permisos comerciales o republicación de contenido, contactar:
https://github.com/Ciber127/cyberSoul-blog

DMCA y Protección:
Cualquier uso no autorizado será reportado a Google y plataformas relevantes.
"@

Set-Content -Path "LICENSE" -Value $licenseContent
Write-Host "✅ LICENSE creado" -ForegroundColor Green

# 2. CREAR COPYRIGHT.md
Write-Host "`n📝 Creando COPYRIGHT.md..." -ForegroundColor Yellow

$copyrightMd = @"
# Copyright y Protección de Contenido

## © 2026 CyberSoul - Todos los derechos reservados

### Propiedad Intelectual

Todo el contenido publicado en CyberSoul, incluyendo pero no limitado a:
- Artículos y posts
- Imágenes y gráficos
- Código y ejemplos
- Diseño y layout

Es propiedad exclusiva de CyberSoul (Ciber127) y está protegido por leyes de 
copyright internacionales.

### Uso Permitido

✅ **Permitido:**
- Leer y disfrutar el contenido
- Compartir links a artículos originales
- Citar breves extractos con atribución apropiada
- Usar el código para aprendizaje personal

❌ **No Permitido:**
- Copiar o republicar artículos completos
- Uso comercial sin autorización
- Scraping automatizado del contenido
- Redistribución sin atribución

### Atribución Requerida

Si citas nuestro contenido, usa este formato:

\`\`\`
Fuente: CyberSoul - [Título del artículo]
URL: https://ciber127.github.io/cyberSoul-blog/
Autor: CyberSoul Team
Fecha: [fecha de publicación]
\`\`\`

### Reporte de Violaciones

Si encuentras contenido copiado sin autorización, repórtalo a:
- Email: copyright@cybersoul.blog
- GitHub Issues: https://github.com/Ciber127/cyberSoul-blog/issues

### Licencia del Código

El código fuente (configuración Hugo, templates) está disponible para 
referencia bajo los términos especificados en LICENSE.

---

**Última actualización:** Enero 2026
"@

Set-Content -Path "COPYRIGHT.md" -Value $copyrightMd
Write-Host "✅ COPYRIGHT.md creado" -ForegroundColor Green

# 3. ACTUALIZAR hugo.toml CON CONFIGURACIÓN COMPLETA
Write-Host "`n⚙️  Actualizando hugo.toml..." -ForegroundColor Yellow

$hugoConfig = @"
baseURL = 'https://ciber127.github.io/cyberSoul-blog/'
languageCode = 'es'
title = 'CyberSoul - El Futuro Digital'
theme = 'PaperMod'

[params]
  description = "Explorando IA, Ciberseguridad y las Tecnologías que Definirán el Próximo Siglo"
  author = "CyberSoul Team"
  keywords = ["IA", "Inteligencia Artificial", "Ciberseguridad", "Tecnología", "Futuro Digital"]
  
  # Copyright
  copyright = "© 2026 CyberSoul. Todos los derechos reservados. El contenido no puede ser reproducido sin autorización."
  
  # Características
  ShowReadingTime = true
  ShowShareButtons = true
  ShowPostNavLinks = true
  ShowBreadCrumbs = true
  ShowCodeCopyButtons = true
  ShowRssButtonInSectionTermList = true
  ShowToc = true
  TocOpen = false
  
  # Analytics (Agregar tu ID cuando tengas)
  # googleAnalytics = "G-XXXXXXXXXX"

  # Imágenes
  images = ["/images/cybersoul-og.jpg"]

[params.homeInfoParams]
  Title = "Bienvenido a CyberSoul 🚀"
  Content = """
  Explorando el futuro digital a través de **IA**, **Ciberseguridad** y **Tecnologías Emergentes**.
  
  📊 Análisis profundos | 🔒 Información verificada | 🚀 Contenido de vanguardia
  """

[[params.socialIcons]]
  name = "github"
  url = "https://github.com/Ciber127"

[[params.socialIcons]]
  name = "twitter"
  url = "https://twitter.com/cybersoul"

[[params.socialIcons]]
  name = "rss"
  url = "/index.xml"

[params.assets]
  favicon = "/favicon.ico"
  favicon16x16 = "/favicon-16x16.png"
  favicon32x32 = "/favicon-32x32.png"

[params.cover]
  linkFullImages = true

# Menu
[menu]
  [[menu.main]]
    identifier = "inicio"
    name = "🏠 Inicio"
    url = "/"
    weight = 1
  
  [[menu.main]]
    identifier = "posts"
    name = "📝 Artículos"
    url = "/posts/"
    weight = 2
  
  [[menu.main]]
    identifier = "ia"
    name = "🤖 IA"
    url = "/categories/ia/"
    weight = 3
  
  [[menu.main]]
    identifier = "ciberseguridad"
    name = "🔒 Ciberseguridad"
    url = "/categories/ciberseguridad/"
    weight = 4
  
  [[menu.main]]
    identifier = "tags"
    name = "🏷️ Tags"
    url = "/tags/"
    weight = 5
  
  [[menu.main]]
    identifier = "sobre"
    name = "ℹ️ Sobre"
    url = "/sobre/"
    weight = 6

# Taxonomías
[taxonomies]
  category = "categories"
  tag = "tags"

# Markup
[markup]
  [markup.highlight]
    style = "monokai"
    lineNos = true
  
  [markup.goldmark.renderer]
    unsafe = true

# Outputs
[outputs]
  home = ["HTML", "RSS", "JSON"]

# Privacy
[privacy]
  [privacy.googleAnalytics]
    anonymizeIP = true
    respectDoNotTrack = true
  
  [privacy.twitter]
    enableDNT = true
"@

Set-Content -Path "hugo.toml" -Value $hugoConfig
Write-Host "✅ hugo.toml actualizado" -ForegroundColor Green

# 4. CREAR GITHUB ACTIONS WORKFLOW
Write-Host "`n🔄 Creando GitHub Actions workflow..." -ForegroundColor Yellow

New-Item -Path ".github/workflows" -ItemType Directory -Force | Out-Null

$workflowContent = @"
name: Deploy Hugo site to Pages

on:
  push:
    branches:
      - main
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

defaults:
  run:
    shell: bash

jobs:
  build:
    runs-on: ubuntu-latest
    env:
      HUGO_VERSION: 0.128.0
    steps:
      - name: Install Hugo CLI
        run: |
          wget -O `${{ runner.temp }}/hugo.deb https://github.com/gohugoio/hugo/releases/download/v`${HUGO_VERSION}/hugo_extended_`${HUGO_VERSION}_linux-amd64.deb \
          && sudo dpkg -i `${{ runner.temp }}/hugo.deb          
      
      - name: Install Dart Sass
        run: sudo snap install dart-sass
      
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: recursive
          fetch-depth: 0

      - name: Setup Pages
        id: pages
        uses: actions/configure-pages@v4

      - name: Install Node.js dependencies
        run: "[[ -f package-lock.json || -f npm-shrinkwrap.json ]] && npm ci || true"

      - name: Build with Hugo
        env:
          HUGO_ENVIRONMENT: production
          HUGO_ENV: production
        run: |
          hugo \
            --gc \
            --minify \
            --baseURL "`${{ steps.pages.outputs.base_url }}/"          

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./public

  deploy:
    environment:
      name: github-pages
      url: `${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
"@

Set-Content -Path ".github/workflows/hugo.yml" -Value $workflowContent
Write-Host "✅ GitHub Actions workflow creado" -ForegroundColor Green

# 5. CREAR PÁGINA SOBRE NOSOTROS
Write-Host "`n📄 Creando página Sobre Nosotros..." -ForegroundColor Yellow

New-Item -Path "content" -ItemType Directory -Force | Out-Null

$sobreContent = @"
---
title: "Sobre CyberSoul"
date: 2026-01-25
draft: false
showToc: false
---

## Nuestra Misión

CyberSoul nace de la convicción de que la tecnología no solo transforma el mundo, 
sino que define cómo vivimos, trabajamos y nos conectamos.

## ¿Qué Hacemos?

Exploramos tres pilares fundamentales del futuro digital:

### 🤖 Inteligencia Artificial
Analizamos cómo la IA está transformando industrias, desde modelos generativos 
hasta sistemas autónomos, con análisis profundo de su impacto real.

### 🔒 Ciberseguridad
Desentrañamos las amenazas emergentes, técnicas de protección y el panorama 
cambiante de la seguridad digital en un mundo hiperconectado.

### 🚀 Tecnologías Futuras
Computación cuántica, blockchain, realidad extendida y las innovaciones que 
definirán los próximos 100 años.

## Nuestros Valores

- **Precisión:** Verificamos cada dato y citamos fuentes confiables
- **Claridad:** Traducimos conceptos complejos sin sacrificar profundidad
- **Independencia:** Opiniones imparciales, sin agendas ocultas
- **Visión de Futuro:** No solo reportamos hoy, exploramos el mañana

## Contacto

- GitHub: [@Ciber127](https://github.com/Ciber127)
- Email: contacto@cybersoul.blog

---

© 2026 CyberSoul. Contenido protegido por copyright.
"@

Set-Content -Path "content/sobre.md" -Value $sobreContent
Write-Host "✅ Página Sobre creada" -ForegroundColor Green

# 6. CREAR ARTÍCULO DE EJEMPLO CON COPYRIGHT
Write-Host "`n📝 Creando artículo de ejemplo..." -ForegroundColor Yellow

New-Item -Path "content/posts" -ItemType Directory -Force | Out-Null

$postContent = @"
---
title: "El Futuro de la IA Generativa en 2026"
date: 2026-01-25T10:00:00-05:00
draft: false
tags: ["IA", "Inteligencia Artificial", "Tecnología", "Futuro"]
categories: ["IA"]
author: "CyberSoul Team"
description: "Análisis profundo de cómo la IA generativa está transformando industrias y creando nuevas oportunidades en 2026"
cover:
    image: ""
    alt: "IA Generativa 2026"
    caption: "El futuro de la inteligencia artificial"
ShowToc: true
TocOpen: true
---

## Introducción

La inteligencia artificial generativa ha dejado de ser una promesa futurista para 
convertirse en la herramienta definitoria de nuestra era. En 2026, estamos 
presenciando transformaciones que hace apenas dos años parecían ciencia ficción.

<!--more-->

## El Estado Actual de la IA

Los modelos de lenguaje de última generación han alcanzado niveles de sofisticación 
que desafían incluso a los expertos:

- **Claude Opus 4.5, GPT-5 y Gemini Ultra 2.0** demuestran capacidades emergentes sorprendentes
- Razonamiento multi-paso con precisión superior al 95%
- Generación de código production-ready
- Comprensión contextual profunda (200k+ tokens)

### Capacidades Clave

1. **Multimodalidad nativa:** Integración fluida de texto, imagen, audio y video
2. **Personalización adaptativa:** Aprendizaje en contexto ajustado al usuario
3. **Razonamiento complejo:** Resolución de problemas matemáticos avanzados

## Transformación Industrial

### Medicina y Diagnóstico

Sistemas como **Med-PaLM 3** están revolucionando el diagnóstico médico con:

- Análisis de imágenes médicas con precisión comparable a especialistas
- Identificación de patrones en millones de casos históricos
- Predicción de complicaciones antes de que se manifiesten

### Educación Personalizada

Las plataformas educativas impulsadas por IA ahora pueden:

- Crear planes de estudio completamente personalizados
- Generar ejercicios adaptados al nivel individual
- Proporcionar tutorías 24/7 en cualquier materia

## Desafíos Éticos

Con gran poder viene gran responsabilidad:

- **Desinformación y Deepfakes:** Videos hiperrealistas circulan con facilidad
- **Desplazamiento Laboral:** 30% de trabajos de oficina significativamente transformados
- **Privacidad y Datos:** Preocupaciones sobre el uso de información personal

## El Futuro: Próximos 2-5 Años

### Tendencias Emergentes

1. **IA Multimodal Unificada:** Sistemas que integran perfectamente todos los medios
2. **Agentes Autónomos:** Capaces de planificar y ejecutar tareas complejas multi-paso
3. **Personalización Extrema:** Modelos que te conocen mejor que cualquier humano

## Conclusión

La IA generativa no es una tendencia pasajera. Es una transformación fundamental 
comparable a la llegada de internet o la electricidad.

**Aquellos que aprendan a trabajar con estas herramientas tendrán una ventaja masiva 
en la economía del futuro.**

El futuro de la IA generativa no es algo que observamos pasivamente. Es algo que 
construimos, cuestionamos y moldeamos cada día.

---

**Nota:** Este artículo es contenido original de CyberSoul y está protegido por copyright. 
Para republicación o uso comercial, contactar al autor.

© 2026 CyberSoul. Todos los derechos reservados.
"@

Set-Content -Path "content/posts/ia-generativa-2026.md" -Value $postContent
Write-Host "✅ Artículo de ejemplo creado" -ForegroundColor Green

# 7. CREAR .gitignore
Write-Host "`n🚫 Creando .gitignore..." -ForegroundColor Yellow

$gitignoreContent = @"
# Hugo
/public/
/resources/_gen/
hugo_stats.json

# OS
.DS_Store
Thumbs.db

# IDE
.vscode/
.idea/
*.swp
*.swo

# Temp
*.log
*.tmp
"@

Set-Content -Path ".gitignore" -Value $gitignoreContent
Write-Host "✅ .gitignore creado" -ForegroundColor Green

# 8. CREAR README.md PROFESIONAL
Write-Host "`n📖 Creando README.md..." -ForegroundColor Yellow

$readmeContent = @"
# 🚀 CyberSoul - El Futuro Digital

[![Deploy Status](https://github.com/Ciber127/cyberSoul-blog/actions/workflows/hugo.yml/badge.svg)](https://github.com/Ciber127/cyberSoul-blog/actions/workflows/hugo.yml)
[![License](https://img.shields.io/badge/License-Copyright-red.svg)](LICENSE)

Blog profesional sobre Inteligencia Artificial, Ciberseguridad y Tecnologías del Futuro.

🌐 **Sitio:** https://ciber127.github.io/cyberSoul-blog/

## 📚 Contenido

- 🤖 **Inteligencia Artificial:** Análisis de IA generativa, machine learning y AGI
- 🔒 **Ciberseguridad:** Amenazas emergentes y protección digital
- 🚀 **Tech Futuro:** Computación cuántica, blockchain y tecnologías disruptivas

## 🛠️ Tecnología

- **Framework:** Hugo (Static Site Generator)
- **Tema:** PaperMod
- **Deploy:** GitHub Pages con GitHub Actions
- **CI/CD:** Automatizado con cada push

## 📝 Crear Nuevo Post

\`\`\`bash
hugo new content/posts/nombre-del-post.md
\`\`\`

## 🔧 Desarrollo Local

\`\`\`bash
hugo server -D
\`\`\`

Abre: http://localhost:1313

## 🚀 Publicar

\`\`\`bash
git add .
git commit -m "Nuevo post: Título"
git push
\`\`\`


## 📄 Copyright

© 2026 CyberSoul. Todos los derechos reservados.

El contenido de este blog está protegido por copyright. Ver [COPYRIGHT.md](COPYRIGHT.md) para más información.

## 📧 Contacto

- **GitHub:** [@Ciber127](https://github.com/Ciber127)
- **Email:** contacto@cybersoul.blog

---

Hecho con ❤️ y Hugo
"@

Set-Content -Path "README.md" -Value $readmeContent
Write-Host "✅ README.md creado" -ForegroundColor Green

# 9. HACER COMMIT Y PUSH
Write-Host "`n📤 Preparando archivos para Git..." -ForegroundColor Yellow

git add .

