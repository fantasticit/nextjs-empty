#! /bin/bash
node -v
npm -v

npm i -g pnpm
pnpm -v

pnpm install
pnpm run build

outputDir="output"

cp -v -L package.json ${clientOutput}
cp -v -L next.config.js ${clientOutput}
cp -v -L -r public ${clientOutput}
cp -v -L -r .next ${clientOutput}

cd ${outputDir}
npm set-script prepare ""
pnpm install -r --offline --prod
cd ../

tar -zvcf output.tar.gz output
echo "${outputDir} 打包完成"
