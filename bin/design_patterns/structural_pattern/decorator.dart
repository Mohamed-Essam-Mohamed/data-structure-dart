abstract class Button {
  void render();
}

class SimpleButton implements Button {
  @override
  void render() {
    print("Rendering a simple button");
  }
}

class ButtonDecorator implements Button {
  final Button button;

  ButtonDecorator(this.button);

  @override
  void render() {
    button.render();
  }
}

class BorderButtonDecorator extends ButtonDecorator {
  BorderButtonDecorator(super.button);

  @override
  void render() {
    super.render();
    print("Adding a border to the button");
  }
}

class ShadowButtonDecorator extends ButtonDecorator {
  ShadowButtonDecorator(super.button);

  @override
  void render() {
    super.render();
    print("Adding a shadow to the button");
  }
}

void main() {
  Button button = SimpleButton();

  button = BorderButtonDecorator(button);

  button = ShadowButtonDecorator(button);

  button.render();
}

// The DataSource interface defines operations that can be altered by decorators.
abstract class DataSource {
  void writeData(String data);
  String readData();
}

// Concrete component that provides default implementations for the operations.
class FileDataSource implements DataSource {
  final String filename;

  FileDataSource(this.filename);

  @override
  void writeData(String data) {
    // Write data to file.
    print('Writing data to file: $data');
  }

  @override
  String readData() {
    // Read data from file.
    print('Reading data from file');
    return 'data from $filename';
  }
}

// The base decorator class follows the same interface as other components.
// It delegates all work to the wrapped component.
class DataSourceDecorator implements DataSource {
  final DataSource wrappee;

  DataSourceDecorator(this.wrappee);

  @override
  void writeData(String data) {
    wrappee.writeData(data);
  }

  @override
  String readData() {
    return wrappee.readData();
  }
}

// Concrete decorator for encryption.
class EncryptionDecorator extends DataSourceDecorator {
  EncryptionDecorator(super.source);
  @override
  void writeData(String data) {
    // Encrypt the data before writing.
    final encryptedData = 'encrypted($data)';
    print('Encrypting data: $data');
    wrappee.writeData(encryptedData);
  }

  @override
  String readData() {
    // Decrypt the data after reading.
    final data = wrappee.readData();
    print('Decrypting data');
    return 'decrypted($data)';
  }
}

// Concrete decorator for compression.
class CompressionDecorator extends DataSourceDecorator {
  CompressionDecorator(DataSource source) : super(source);

  @override
  void writeData(String data) {
    // Compress the data before writing.
    final compressedData = 'compressed($data)';
    print('Compressing data: $data');
    wrappee.writeData(compressedData);
  }

  @override
  String readData() {
    // Decompress the data after reading.
    final data = wrappee.readData();
    print('Decompressing data');
    return 'decompressed($data)';
  }
}

// A simple example of using decorators to wrap the component.
class Application {
  void dumbUsageExample() {
    DataSource source = FileDataSource("somefile.dat");

    source.writeData("salaryRecords"); // Writes plain data.

    source = CompressionDecorator(source);
    source.writeData("salaryRecords"); // Writes compressed data.

    source = EncryptionDecorator(source);
    source.writeData("salaryRecords"); // Writes compressed and encrypted data.
  }
}

// Client class that uses a DataSource without knowing its specific type.
class SalaryManager {
  final DataSource source;

  SalaryManager(this.source);

  String load() {
    return source.readData();
  }

  void save(String data) {
    source.writeData(data);
  }
}

// Configurator that sets up the data source with required decorators based on configuration.
class ApplicationConfigurator {
  bool enabledEncryption = true;
  bool enabledCompression = true;

  void configurationExample() {
    DataSource source = FileDataSource("salary.dat");

    if (enabledEncryption) {
      source = EncryptionDecorator(source);
    }
    if (enabledCompression) {
      source = CompressionDecorator(source);
    }

    SalaryManager logger = SalaryManager(source);
    logger.save("salaryRecords");
    String salary = logger.load();
    print(salary);
  }
}

////////////////
///
abstract class Notifier {
  void notify();
}

class EmailNotifier implements Notifier {
  String email;
  EmailNotifier(this.email);
  @override
  void notify() {
    print(
        "Your latest operation was executed successfully. Email sent to $email");
  }
}
// 
class  NotifierDecorator implements Notifier {
  final Notifier wrappee;
  NotifierDecorator(this.wrappee);
  @override
  void notify() {
    wrappee.notify();
  }
}

class SMSNotifierDecorator extends NotifierDecorator {
  int phoneNumber;
  SMSNotifierDecorator(super.wrappee , this.phoneNumber);
  @override
  void notify() {
    print("Your latest operation was executed successfully. SMS sent");
  }
}