import React, { Component } from 'react';
import { Text, View } from 'react-native';
import { enableFreeze, enableScreens } from 'react-native-screens';

// @ts-ignore
global[Symbol.for('apollo.deprecations')] = true;

import 'moment/min/locales';

class App extends Component<{}> {
  constructor(props: any) {
    super(props);
    enableScreens();
    enableFreeze();
  }

  render() {
    return (
      <View style={{ height: '100%', justifyContent: 'center' }}>
        <Text
          style={{
            width: '100%',
            textAlign: 'center',
            fontSize: 100,
            fontWeight: 700,
          }}>
          Test
        </Text>
      </View>
    );
  }
}

export default App;
