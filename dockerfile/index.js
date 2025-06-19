const express = require('express');
const chalk = require('chalk');
const gradient = require('gradient-string');
const app = express();

const html1 = `
  <html>
    <body style="background: linear-gradient(90deg, #92fe9d 0%, #00c9ff 100%); height: 100vh; margin:0;">
      <h1 style="color:#232526; text-align:center; padding-top: 20vh; font-size:3em; font-family:monospace;">
        🌈 <span style="color:#ff9800;">This is <b>*** nodejs based application  ***</b>!</span> 🌈
      </h1>
    </body>
  </html>
`;

const html2 = `
  <html>
    <body style="background: linear-gradient(90deg, #f7971e 0%, #ffd200 100%); height: 100vh; margin:0;">
      <h1 style="color:#232526; text-align:center; padding-top: 20vh; font-size:3em; font-family:monospace;">
        🎨 <span style="color:#673ab7;">This is <b>api2</b>!</span> 🎨
      </h1>
    </body>
  </html>
`;

app.get('/', (req, res) => {
  res.send(html1);
});

app.get('/api', (req, res) => {
  res.send(html2);
});

const port = 3000;
app.listen(port, '0.0.0.0', () => {
  // Colorful terminal output
  console.log(
    gradient.rainbow(
      `\n🚀 Server running on port ${chalk.bold(port)} 🚀\n` +
      `Visit: ${chalk.cyanBright('http://localhost:3000/')}\n` +
      `API:   ${chalk.magentaBright('http://localhost:3000/api')}\n`
    )
  );
});
