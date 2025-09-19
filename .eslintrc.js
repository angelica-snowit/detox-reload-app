module.exports = {
  root: true,
  extends: ['plugin:prettier/recommended', '@react-native'],
  parser: '@typescript-eslint/parser',
  plugins: ['@typescript-eslint', 'jest', 'detox'],
  overrides: [
    {
      files: ['*.ts', '*.tsx'],
      rules: {
        '@typescript-eslint/no-shadow': ['error'],
        'no-shadow': 'off',
        'no-undef': 'off',
        'react-hooks/exhaustive-deps': 'off',
        'react-native/no-unused-styles': 0,
      },
    },
  ],
};
