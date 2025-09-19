module.exports = {
  presets: ['module:@react-native/babel-preset', '@babel/preset-typescript'],
  plugins: [
    [
      'module-resolver',
      {
        root: ['.'], //  This says the root of your project folder
        // To make your imports look better
        // Insert your whatever name to make alias for the imports
        // In this example I'm using @Components to referring the Components' folder
        // That located inside src folder.
        // Note: You can make a lot of aliases in here
        extensions: ['.ts', '.tsx'],
        alias: {
          '@components': './src/Components',
          '@navigation': './src/Navigation',
          '@services': './src/Services',
          '@routes': './src/Navigation/ROUTES.ts',
          '@translations': './src/Translations',
          '@screens': './src/Screens',
          '@theme': './src/Theme',
          '@store': './src/Store',
          '@utils': './src/Utils',
          '@hooks': './src/Hooks',
          '@config': './config',
          '@models': './models',
          '@graphQL': './src/GraphQL',
          '@providers': './src/Providers',
        },
      },
    ],
    ['react-native-reanimated/plugin'],
  ],
};
