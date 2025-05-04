#!/usr/bin/env bash
set -e

# Scaffold the Flutter project IN PLACE (dot) so the repo root == project root
flutter create .

# Add your core packages
flutter pub add flutter_riverpod hive hive_flutter \
                 freezed_annotation json_annotation
flutter pub add --dev build_runner freezed

echo "Flutter scaffold complete."

