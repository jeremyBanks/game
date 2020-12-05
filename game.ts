#!/usr/bin/env -S deno run --allow-all
import * as colors from "https://deno.land/std@0.79.0/fmt/colors.ts";

import { print } from "./common.ts";

let main = async () => {
  print("hello, world!");
  print("hello, " + colors.green("world"));
  print(`hello, ${colors.blue("world")}`);
  print(`${colors.yellow("hello")}, ${colors.green("world")}`);
};

main();
