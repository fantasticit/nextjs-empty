#! /bin/bash
node -v
npm -v

npm i -g pnpm
pnpm -v

pnpm install
pnpm run build

outputDir="output"

if [ -d ${outputDir} ]; then
  rm -rfv ${outputDir}
fi
mkdir -p ${outputDir}

cp -v -L package.json ${outputDir}
cp -v -L next.config.mjs ${outputDir}
cp -v -L pnpm-lock.yaml ${outputDir}
cp -v -L -r public ${outputDir}
cp -v -L -r .next ${outputDir}

cd ${outputDir}
npm set-script prepare ""
pnpm install -r --offline --prod
cd ../

tar -zvcf output.tar.gz output
echo "${outputDir} 打包完成"
