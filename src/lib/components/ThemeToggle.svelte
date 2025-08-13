<script lang="ts">
	import { toggleTheme, theme } from '$lib/stores/theme';

	$: currentTheme = $theme;
</script>

<button
	on:click={toggleTheme}
	class="theme-toggle"
	aria-label="Toggle theme"
	title="Toggle between minimal and vibrant themes"
>
	{#if currentTheme === 'minimal'}
		<span>✨</span>
		<span>Vibrant</span>
	{:else}
		<span>🎨</span>
		<span>Minimal</span>
	{/if}
</button>
