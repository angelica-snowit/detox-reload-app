import { device } from 'detox';

describe('Train Purchase', () => {
  jest.setTimeout(300000);
  beforeAll(async () => {
    await device.launchApp({
      permissions: {
        notifications: 'YES',
        faceid: 'YES',
        camera: 'YES',
      },
    });
    await device.setBiometricEnrollment(false);
  });

  it('should reload app', async () => {
    await device.reloadReactNative();
  });
});
