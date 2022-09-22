const core = require('@actions/core');
const glob = require('@actions/glob');
const path = require('path');
const fs = require('fs');

async function run() {
  try {
    core.info('Search for missing package-lock.json files');

    const patterns = ['**/package.json', '!node_modules/**/package.json'];
    const globber = await glob.create(patterns.join('\n'))
    const files = await globber.glob()

    async function handleFile(f) {
      try {
        await fs.access(path.join(path.dirname(f), 'package-lock.json'));
      } catch (err) {
        // File don't exists
        core.warning('Consider to generate it and commit it', {
          title: "Missing package-lock.json",
          file: file
        });
      }
    }


    await files.forEach(async file => await handleFile);
  }
  catch (error) {
    core.setFailed(error.message);
  }
}

run()
