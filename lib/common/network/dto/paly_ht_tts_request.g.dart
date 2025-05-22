// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paly_ht_tts_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PalyHtTtsRequestDTO _$PalyHtTtsRequestDTOFromJson(Map json) =>
    PalyHtTtsRequestDTO(
      outputFormat: json['output_format'] as String,
      text: json['text'] as String,
      voice: json['voice'] as String,
      voiceEngine: json['voice_engine'] as String,
    );

Map<String, dynamic> _$PalyHtTtsRequestDTOToJson(
        PalyHtTtsRequestDTO instance) =>
    <String, dynamic>{
      'text': instance.text,
      'voice': instance.voice,
      'output_format': instance.outputFormat,
      'voice_engine': instance.voiceEngine,
    };
