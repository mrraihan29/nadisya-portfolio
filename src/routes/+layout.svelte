<script lang="ts">
	import '../app.css';
	import favicon from '$lib/assets/favicon.svg';
	import { theme } from '$lib/stores/theme';
	import { onMount } from 'svelte';

	let { children } = $props();

	// Initialize theme on mount
	onMount(() => {
		// Set initial theme attribute
		document.documentElement.setAttribute('data-theme', $theme);
	});
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
	<title>Nadisya - Creative Developer</title>
	<meta
		name="description"
		content="Creative developer crafting digital experiences that bridge art and technology with intention."
	/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta property="og:title" content="Nadisya - Creative Developer" />
	<meta
		property="og:description"
		content="Creative developer crafting digital experiences that bridge art and technology with intention."
	/>
	<meta property="og:type" content="website" />
</svelte:head>

{@render children?.()}
