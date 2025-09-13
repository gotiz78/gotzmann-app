# PR Scope Validation

To ensure that Pull Requests remain small, focused, and easy to review, this repository uses an automated scope check. Every PR must include a `SCOPE.txt` file in its root, which declares which files are expected to be changed.

The CI will fail if you modify a file that is not covered by the patterns in `SCOPE.txt`.

## How to use `SCOPE.txt`

The `SCOPE.txt` file contains a list of glob patterns. Each line represents one pattern. A changed file must match at least one of these patterns.

### Examples

**Example 1: Changing the booking feature**

If your task is to change the booking screen and a related configuration file, your `SCOPE.txt` might look like this:

```
lib/features/booking/*
lib/config/forms.dart
test/booking_*.dart
```

This allows changes to any file within the `lib/features/booking/` directory, the specific `forms.dart` config file, and any test file starting with `booking_`.

**Example 2: Updating a widget and its tests**

```
lib/widgets/app_footer.dart
test/widgets/app_footer_test.dart
```

**Example 3: Changing a CI workflow**

```
.github/workflows/scope_check.yml
```

By defining the scope upfront, both the author and the reviewer have a clear understanding of the intended changes, which helps to prevent scope creep and keep the development process focused.
