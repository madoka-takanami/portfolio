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
          "primary": "#edb03a",
          "secondary": "#68c5d6",
          "accent": "#db484a",
          "neutral": "#221924",
          "base-100": "#FAF9FA",
          "info": "#5FC5E7",
          "success": "#0C6452",
          "warning": "#C38513",
          "error": "#E1362D",
        },
      },
    ],
  },

  plugins: [
    require("daisyui")
  ],
}
