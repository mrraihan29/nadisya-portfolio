import { writable } from 'svelte/store';
import { browser } from '$app/environment';

export type Theme = 'minimal' | 'vibrant';

// Initialize theme from localStorage or default to 'minimal'
const getInitialTheme = (): Theme => {
	if (browser) {
		const stored = localStorage.getItem('portfolio-theme');
		return (stored as Theme) || 'minimal';
	}
	return 'minimal';
};

export const theme = writable<Theme>(getInitialTheme());

// Subscribe to theme changes and update localStorage and document
if (browser) {
	theme.subscribe((value) => {
		localStorage.setItem('portfolio-theme', value);
		document.documentElement.setAttribute('data-theme', value);
	});
}

export const toggleTheme = () => {
	theme.update((current) => (current === 'minimal' ? 'vibrant' : 'minimal'));
};
