// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
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

  RecipeDao? _recipeDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `RecipeEntity` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `description` TEXT NOT NULL, `prepare` TEXT NOT NULL, `cook` TEXT NOT NULL, `ingredients` INTEGER NOT NULL, `steps` INTEGER NOT NULL, `fileName` TEXT NOT NULL, `tags` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  RecipeDao get recipeDao {
    return _recipeDaoInstance ??= _$RecipeDao(database, changeListener);
  }
}

class _$RecipeDao extends RecipeDao {
  _$RecipeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _recipeEntityInsertionAdapter = InsertionAdapter(
            database,
            'RecipeEntity',
            (RecipeEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'prepare': item.prepare,
                  'cook': item.cook,
                  'ingredients': item.ingredients,
                  'steps': item.steps,
                  'fileName': item.fileName,
                  'tags': item.tags
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RecipeEntity> _recipeEntityInsertionAdapter;

  @override
  Future<List<RecipeEntity>> findAllRecipes() async {
    return _queryAdapter.queryList('SELECT * FROM RecipeEntity',
        mapper: (Map<String, Object?> row) => RecipeEntity(
            row['name'] as String,
            row['description'] as String,
            row['prepare'] as String,
            row['cook'] as String,
            row['ingredients'] as int,
            row['steps'] as int,
            row['fileName'] as String,
            row['tags'] as String));
  }

  @override
  Stream<RecipeEntity?> findRecipeById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM RecipeEntity WHERE id = ?1',
        mapper: (Map<String, Object?> row) => RecipeEntity(
            row['name'] as String,
            row['description'] as String,
            row['prepare'] as String,
            row['cook'] as String,
            row['ingredients'] as int,
            row['steps'] as int,
            row['fileName'] as String,
            row['tags'] as String),
        arguments: [id],
        queryableName: 'RecipeEntity',
        isView: false);
  }

  @override
  Future<void> insertRecipe(RecipeEntity recipe) async {
    await _recipeEntityInsertionAdapter.insert(
        recipe, OnConflictStrategy.abort);
  }
}
