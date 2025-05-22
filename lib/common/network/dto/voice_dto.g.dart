// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoiceDTO _$VoiceDTOFromJson(Map json) => VoiceDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      voiceEngine: json['voice_engine'] as String,
    );

Map<String, dynamic> _$VoiceDTOToJson(VoiceDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'voice_engine': instance.voiceEngine,
    };
