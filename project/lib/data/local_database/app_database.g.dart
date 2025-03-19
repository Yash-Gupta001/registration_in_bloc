// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user` (`id` INTEGER NOT NULL, `batchNo` TEXT, `sectionNo` TEXT, `semesterNo` TEXT, `branchNo` TEXT, `currentSemesterName` TEXT, `currentSemesterNo` TEXT, `currentSessionName` TEXT, `currentSessionNo` TEXT, `uaStatus` INTEGER, `subCollegeName` TEXT, `organizationId` TEXT, `collegeId` TEXT, `mobileNo` TEXT, `email` TEXT, `regNo` TEXT, `uaNo` TEXT, `idNo` TEXT, `userName` TEXT, `uaType` TEXT, `uaDesignation` TEXT, `degreeName` TEXT, `isFirstLogin` INTEGER, `branchName` TEXT, `semesterName` TEXT, `collegeName` TEXT, `collegeLogo` TEXT, `sessionName` TEXT, `sessionNo` INTEGER, `token` TEXT, `collegeCode` INTEGER, `enrollmentNo` TEXT, `password` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userInfoInsertionAdapter = InsertionAdapter(
            database,
            'user',
            (UserInfo item) => <String, Object?>{
                  'id': item.id,
                  'batchNo': item.batchNo,
                  'sectionNo': item.sectionNo,
                  'semesterNo': item.semesterNo,
                  'branchNo': item.branchNo,
                  'currentSemesterName': item.currentSemesterName,
                  'currentSemesterNo': item.currentSemesterNo,
                  'currentSessionName': item.currentSessionName,
                  'currentSessionNo': item.currentSessionNo,
                  'uaStatus': item.uaStatus,
                  'subCollegeName': item.subCollegeName,
                  'organizationId': item.organizationId,
                  'collegeId': item.collegeId,
                  'mobileNo': item.mobileNo,
                  'email': item.email,
                  'regNo': item.regNo,
                  'uaNo': item.uaNo,
                  'idNo': item.idNo,
                  'userName': item.userName,
                  'uaType': item.uaType,
                  'uaDesignation': item.uaDesignation,
                  'degreeName': item.degreeName,
                  'isFirstLogin': item.isFirstLogin == null
                      ? null
                      : (item.isFirstLogin! ? 1 : 0),
                  'branchName': item.branchName,
                  'semesterName': item.semesterName,
                  'collegeName': item.collegeName,
                  'collegeLogo': item.collegeLogo,
                  'sessionName': item.sessionName,
                  'sessionNo': item.sessionNo,
                  'token': item.token,
                  'collegeCode': item.collegeCode,
                  'enrollmentNo': item.enrollmentNo,
                  'password': item.password
                }),
        _userInfoDeletionAdapter = DeletionAdapter(
            database,
            'user',
            ['id'],
            (UserInfo item) => <String, Object?>{
                  'id': item.id,
                  'batchNo': item.batchNo,
                  'sectionNo': item.sectionNo,
                  'semesterNo': item.semesterNo,
                  'branchNo': item.branchNo,
                  'currentSemesterName': item.currentSemesterName,
                  'currentSemesterNo': item.currentSemesterNo,
                  'currentSessionName': item.currentSessionName,
                  'currentSessionNo': item.currentSessionNo,
                  'uaStatus': item.uaStatus,
                  'subCollegeName': item.subCollegeName,
                  'organizationId': item.organizationId,
                  'collegeId': item.collegeId,
                  'mobileNo': item.mobileNo,
                  'email': item.email,
                  'regNo': item.regNo,
                  'uaNo': item.uaNo,
                  'idNo': item.idNo,
                  'userName': item.userName,
                  'uaType': item.uaType,
                  'uaDesignation': item.uaDesignation,
                  'degreeName': item.degreeName,
                  'isFirstLogin': item.isFirstLogin == null
                      ? null
                      : (item.isFirstLogin! ? 1 : 0),
                  'branchName': item.branchName,
                  'semesterName': item.semesterName,
                  'collegeName': item.collegeName,
                  'collegeLogo': item.collegeLogo,
                  'sessionName': item.sessionName,
                  'sessionNo': item.sessionNo,
                  'token': item.token,
                  'collegeCode': item.collegeCode,
                  'enrollmentNo': item.enrollmentNo,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserInfo> _userInfoInsertionAdapter;

  final DeletionAdapter<UserInfo> _userInfoDeletionAdapter;

  @override
  Future<UserInfo?> getUserInfo() async {
    return _queryAdapter.query('SELECT * FROM user',
        mapper: (Map<String, Object?> row) => UserInfo(
            id: row['id'] as int,
            batchNo: row['batchNo'] as String?,
            sectionNo: row['sectionNo'] as String?,
            semesterNo: row['semesterNo'] as String?,
            branchNo: row['branchNo'] as String?,
            currentSemesterName: row['currentSemesterName'] as String?,
            currentSemesterNo: row['currentSemesterNo'] as String?,
            currentSessionName: row['currentSessionName'] as String?,
            currentSessionNo: row['currentSessionNo'] as String?,
            uaStatus: row['uaStatus'] as int?,
            subCollegeName: row['subCollegeName'] as String?,
            organizationId: row['organizationId'] as String?,
            collegeId: row['collegeId'] as String?,
            mobileNo: row['mobileNo'] as String?,
            email: row['email'] as String?,
            regNo: row['regNo'] as String?,
            uaNo: row['uaNo'] as String?,
            idNo: row['idNo'] as String?,
            userName: row['userName'] as String?,
            uaType: row['uaType'] as String?,
            uaDesignation: row['uaDesignation'] as String?,
            degreeName: row['degreeName'] as String?,
            isFirstLogin: row['isFirstLogin'] == null
                ? null
                : (row['isFirstLogin'] as int) != 0,
            branchName: row['branchName'] as String?,
            semesterName: row['semesterName'] as String?,
            collegeName: row['collegeName'] as String?,
            collegeLogo: row['collegeLogo'] as String?,
            sessionName: row['sessionName'] as String?,
            sessionNo: row['sessionNo'] as int?,
            token: row['token'] as String?,
            collegeCode: row['collegeCode'] as int?,
            enrollmentNo: row['enrollmentNo'] as String?,
            password: row['password'] as String?));
  }

  @override
  Future<void> insertUser(UserInfo user) async {
    await _userInfoInsertionAdapter.insert(user, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteUser(UserInfo user) async {
    await _userInfoDeletionAdapter.delete(user);
  }
}
