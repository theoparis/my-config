// https://github.com/kallaspriit/ts-log/blob/master/src/index.ts

/**
 * Represents a generic logger that could be a simple console, bunyan etc.
 */
export interface ILogger {
    trace(message?: unknown, ...optionalParams: unknown[]): void;
    debug(message?: unknown, ...optionalParams: unknown[]): void;
    info(message?: unknown, ...optionalParams: unknown[]): void;
    warn(message?: unknown, ...optionalParams: unknown[]): void;
    error(message?: unknown, ...optionalParams: unknown[]): void;
}

/**
 * Dummy logger that does not do unknownthing.
 *
 * Useful as a default for some library that the user might want to get logs out of.
 */
export const dummyLogger: ILogger = {
    trace: (_message?: unknown, ..._optionalParams: unknown[]) => {},
    debug: (_message?: unknown, ..._optionalParams: unknown[]) => {},
    info: (_message?: unknown, ..._optionalParams: unknown[]) => {},
    warn: (_message?: unknown, ..._optionalParams: unknown[]) => {},
    error: (_message?: unknown, ..._optionalParams: unknown[]) => {},
};