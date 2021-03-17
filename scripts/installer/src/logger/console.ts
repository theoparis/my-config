import * as ink from "ink/mod.ts";
import { BaseLogger } from "./base.ts";
import { ILogger } from "./index.ts";

export class PrefixedConsoleLogger extends BaseLogger {
    // TODO: color option (boolean)
    constructor(
        public prefix: string,
        base?: ILogger,
    ) {
        super(base);
    }

    trace(message?: string, ...optionalParams: unknown[]): void {
        super.trace(
            ink.colorize(`<magenta>${this.prefix}</magenta> > ${message}`),
        );
    }
    debug(message?: string, ...optionalParams: unknown[]): void {
        super.debug(
            ink.colorize(`<blue>${this.prefix}</blue> > ${message}`),
        );
    }
    info(message?: string, ...optionalParams: unknown[]): void {
        super.info(
            ink.colorize(`<green>${this.prefix}</green> > ${message}`),
        );
    }
    warn(message?: string, ...optionalParams: unknown[]): void {
        super.warn(
            ink.colorize(`<yellow>${this.prefix}</yellow> > ${message}`),
        );
    }
    error(message?: string, ...optionalParams: unknown[]): void {
        super.error(
            ink.colorize(`<red>${this.prefix}</red>${message}`),
        );
    }
}
