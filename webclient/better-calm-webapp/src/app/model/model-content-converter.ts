import { Content } from "../domain/content";
import { Playlist } from "../domain/playlist";
import { ModelContent } from "./model-content";
import { PlaylistBasicInfoConverter } from "./playlist-basic-info-converter";

export class ModelContentConverter{
    public static GetDomainContent(modelContent:ModelContent):Content{
        let playlists:Playlist[] = [];
        let playlistIds: number[] = [];
        modelContent.playlists.map(playlist => {
            playlists.push(PlaylistBasicInfoConverter.GetDomainPlaylist(playlist));
            playlistIds.push(playlist.id);
        });
        return {
            artistName: modelContent.artistName,
            categories: modelContent.categories,
            contentLength: modelContent.contentLength,
            contentType: modelContent.contentType,
            contentUrl: modelContent.contentUrl,
            id: modelContent.id,
            imageUrl: modelContent.imageUrl,
            name: modelContent.name,
            playlists: playlists,
            playlistIds: playlistIds
        };
    }
}