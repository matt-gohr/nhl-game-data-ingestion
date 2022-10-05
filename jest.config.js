'use strict';
process.env.TS_JEST_LOG = '/dev/null';
module.exports = {
  clearMocks: true,
  collectCoverage: true,
  coveragePathIgnorePatterns: [
    '/node_modules/',
    '/package.json',
    '/docker-package.json',
    '/package-lock.json',
    '/event.json',
    '/tsconfig.json',
    '/.*\\.json$/',
  ],
  forceCoverageMatch: ['**/src/**/*.ts'],
  globals: {
    'ts-jest': {
      diagnostics: false,
      isolatedModules: false,
      ignoreCodes: ['TS2532', 'TS2341'],
      warnOnly: false,
    },
  },
  maxConcurrency: 3,
  moduleFileExtensions: ['ts', 'js', 'json'],
  silent: false,
  testEnvironment: 'node',
  testPathIgnorePatterns: [
    '/*node_modules/',
    '/vendor',
    '/package-lock.json',
    '/cypress/',
  ],
  testRegex: '/__tests__/.*\\.spec\\.ts$',
  testEnvironmentOptions: {
    url: 'http://localhost/',
  },
  transform: {
    '\\.ts$': 'ts-jest',
  },
  verbose: false,
  watchman: false,
};
