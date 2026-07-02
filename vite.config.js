import { defineConfig } from 'vite'
import { readdirSync } from 'fs'
import { resolve } from 'path'

const pagesDir = new URL('./pages', import.meta.url).pathname

const input = Object.fromEntries(
  readdirSync(pagesDir)
    .filter(f => f.endsWith('.html'))
    .map(f => [f.replace('.html', ''), resolve(pagesDir, f)])
)

export default defineConfig({
  root: 'pages',
  publicDir: '../public',
  envDir: '..',
  base: '/D.E.A.R-TBZ/',
  build: {
    outDir: '../dist',
    emptyOutDir: true,
    rollupOptions: { input }
  }
})
