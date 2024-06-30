module.exports = {
  apps: [
    {
      name: "nextjs-example",
      cwd: ".",
      script: "npm",
      args: "start",
      env: {
        NODE_ENV: "production",
      },
    },
  ],
};
