import * as styles from "https://deno.land/std@0.79.0/fmt/colors.ts";
export { styles };
import { readLines } from "https://deno.land/std@0.79.0/io/bufio.ts";

export const print = (...args: any[]) => console.log(...args);

export const readFile = Deno.readTextFileSync;
export const writeFile = Deno.writeTextFileSync;

export async function input(prompt = ""): Promise<string> {
  if (prompt) {
    Deno.writeAllSync(Deno.stderr, new TextEncoder().encode(prompt));
  }

  for await (const line of readLines(Deno.stdin)) {
    return line;
  }

  print(styles.red("expected user input but got not, exiting"));
  Deno.exit(1);
}
