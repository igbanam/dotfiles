vim9script

# Projects (vim-projectionist, editorconfig-vim) ------------------------- {{{
g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

g:projectionist_heuristics = {
  "Poet": {
    "*.txt": {
      "type": "note",
      "template": "title: {basename|capitalize}\ntags:\n\n"
      },
    },
  "Cargo.toml": {
    "*": {
      "make": "cargo",
      },
    },
  ".hanamirc": {
    "*": {
      "start": "hanami server",
      "console": "hanami console",
      },
    },
  "*.gemspec|.hanamirc": {
    "spec/*_spec.rb": {
      "alternate": "lib/{}.rb",
      "command": "spec"
      },
    "lib/*.rb": { "alternate": "spec/{}_spec.rb" }
    },
  "shard.yml": {
    "src/*.cr": {
      "type": "source",
      "alternate": "spec/{}_spec.cr"
      },
    "spec/*_spec.cr": {
      "type": "test",
      "alternate": "src/{}.cr"
      },
    "*": {
      "make": "shards build --no-color",
      }
    },
  "package.json": {
    "*": {
      "start": "yarn start",
      "make": "yarn build",
      },
    },
  "composer.json": {
    "*": {
      "start": "composer serve",
      "make": "composer update",
      },
    },
  "build.gradle": {
    "src/main/java/*.java": {
      "alternate": "src/test/java/{}Tests.java",
      },
    "src/test/java/*Tests.java": {
      "alternate": "src/main/java/{}.java",
      "command": "spec"
      },
    },
  "Gemfile": {
    "app/serializers/*_serializer.rb": {
      "command": "serializer",
      "affinity": "model",
      "test": "spec/serializers/{}_spec.rb",
      "related": "app/models/{}.rb",
      "template": "class {camelcase|capitalize|colons}Serializer < ActiveModel::Serializer\nend"
      }
    },
  }
# ------------------------------------------------------------------------ }}}
