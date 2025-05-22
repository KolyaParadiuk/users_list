// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_ai_tts_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenAITtsRequest _$OpenAITtsRequestFromJson(Map json) => OpenAITtsRequest(
      input: json['input'] as String,
      responseFormat: json['response_format'] as String,
      voice: json['voice'] as String,
      model: json['model'] as String,
    );

Map<String, dynamic> _$OpenAITtsRequestToJson(OpenAITtsRequest instance) =>
    <String, dynamic>{
      'input': instance.input,
      'voice': instance.voice,
      'response_format': instance.responseFormat,
      'model': instance.model,
    };
