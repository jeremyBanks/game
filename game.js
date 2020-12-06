#!/usr/bin/env -S deno run --allow-all
import { input, print, readFile, styles } from "./common.ts";

async function main() {
  print("hello, world!");

  print("hello, " + styles.green("world"));
  print(`hello, ${styles.blue("world")}`);
  print(`${styles.yellow("hello")}, ${styles.green("world")}`);

  let thisScriptItself = readFile("./game.js");
  print(styles.italic(styles.cyan(thisScriptItself)));

  let name = await input("what is your name? ");

  print(`hello, ${name}!`);
}

main();
