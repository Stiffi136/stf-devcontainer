export default [
  {
    linterOptions: {
      reportUnusedDisableDirectives: true,
    },
    rules: {
      // Custom baseline rules for new projects
      "no-console": "warn",
      "no-debugger": "error",
      "eqeqeq": ["error", "always"],
      "curly": ["error", "all"],
      "prefer-const": "error"
    }
  }
];
