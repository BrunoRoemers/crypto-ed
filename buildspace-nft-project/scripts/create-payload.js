const strToBase64 = str => Buffer.from(str, 'utf-8').toString('base64');

const svg = `
<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350">
    <style>.base { fill: black; font-family: serif; font-size: 14px; }</style>
    <rect width="100%" height="100%" fill="pink" />
    <text x="50%" y="50%" class="base" dominant-baseline="middle" text-anchor="middle">HotSauceHerald</text>
</svg>
`

const json = {
  name: 'Text in square',
  description: 'Text in square',
  image: `data:image/svg+xml;base64,${strToBase64(svg)}`,
}

const payload = `data:application/json;base64,${strToBase64(JSON.stringify(json))}`

console.log(payload)
