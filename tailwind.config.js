/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.html.erb',
  ],
  blocklist: [
    'modal',
    'modal-bottom',
  ],
  theme: {
    screens: {
      'sm': { 'max': '420px' },
      'md': { 'max': '900px' },
      'lg': { 'max': '1200px' },
    },
    extend: {},
  },
  daisyui: {
    themes: [
      {
        mytheme: {
          "primary": "#562400",
          "secondary": "#c6d557",
          "accent": "#d47164",
          "neutral": "#eba12d",
          "base-100": "#f6cfb3",
          "info": "#fbbd5f",
          "success": "#98E4D2",
          "warning": "#FFEE55",
          "error": "#e9967a",
        },
      },
    ],
  },
  plugins: [
    require("daisyui")
  ],
}
