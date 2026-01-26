import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_repo.g.dart';

class StorageRepository {
  final SupabaseClient _supabase;

  StorageRepository(this._supabase);

  Future<String> uploadFile({
    required String bucketId,
    required String path,
    required Uint8List fileData,
    String? contentType,
  }) async {
    await _supabase.storage
        .from(bucketId)
        .uploadBinary(
          path,
          fileData,
          fileOptions: FileOptions(contentType: contentType, upsert: true),
        );

    return _supabase.storage.from(bucketId).getPublicUrl(path);
  }

  Future<void> deleteFile(String bucketId, String url) async {
    // Extract path from URL
    // Format: .../storage/v1/object/public/{bucketId}/{path}
    // We assume standard Supabase URL structure
    if (!url.contains('/$bucketId/')) {
      throw Exception('Invalid URL for bucket $bucketId');
    }
    final path = url.split('/$bucketId/').last;
    await _supabase.storage.from(bucketId).remove([path]);
  }
}

@riverpod
StorageRepository storageRepository(ref) {
  return StorageRepository(Supabase.instance.client);
}
